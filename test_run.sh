#!/bin/bash

set -eu -o pipefail

FQ1=YJDIS2_ATCACG_L002_R1_001
FQ2=YJDIS2_ATCACG_L002_R2_001
 FQ=YJDIS2_ATCACG 
 TM=DIS2_trimmed
dir=$HOME/ngs_pipe/output/illumip

# check tools working

echo "RUNNING fastQC"
mkdir -p output/fastqc
docker run --rm -v $HOME/ngs_pipe/:/data/ fastqc /data/input/$FQ1.fastq.gz -o /data/output/fastqc/
# docker run --rm -v $HOME/ngs_pipe/:/data/ fastqc /data/input/$FQ2.fastq.gz -o /data/output/fastqc/

echo "RUNNING IllumiProcessor"
rm -rf $dir
docker run --rm -v $HOME/ngs_pipe/:/data/ illumiprocessor \
       --input /data/input/ \
       --output /data/output/illumip \
       --config /data/input/jy.0102.DNA.config \
       --trimmomatic /miniconda/jar/trimmomatic.jar \
       --cores 10 \
       --log-path /data/output/illumip
# files generated:
# $TM/split-adapter-quality-trimmed/$TM-READ1.fastq.gz $TM-READ2.fastq.gz $TM-READ-singleton.fastq.gz


echo "Merging reads ... (not run yet)"
# cat $dir/$TM/split-adapter-quality-trimmed/$TM-READ-singleton.fastq.gz $dir/$TM/split-adapter-quality-trimmed/$TM-READ1.fastq.gz > \
#   $dir/$TM/$TM-R1.fastq.gz


echo "Modify sequence identifiers"
zcat $dir/$TM/split-adapter-quality-trimmed/$TM-READ1.fastq.gz | $HOME/ngs_pipe/tools/QCthereads.pl 1| gzip > $HOME/ngs_pipe/output/$TM-R1.md.fq.gz
zcat $dir/$TM/split-adapter-quality-trimmed/$TM-READ2.fastq.gz | $HOME/ngs_pipe/tools/QCthereads.pl 2| gzip > $HOME/ngs_pipe/output/$TM-R2.md.fq.gz

echo "RUNNING SortMeRNA"
mkdir -p output/sortmerna
# ./sortmerna --ref db.fasta,db.idx --reads file.fa --aligned base_name_output
docker run --rm -v $HOME/ngs_pipe/:/data/ sortmerna \
       --ref ./rRNA_databases/silva-bac-16s-id90.fasta,./index/silva-bac-16s-db:\
./rRNA_databases/silva-bac-23s-id98.fasta,./index/silva-bac-23s-db:\
./rRNA_databases/silva-arc-16s-id95.fasta,./index/silva-arc-16s-db:\
./rRNA_databases/silva-arc-23s-id98.fasta,./index/silva-arc-23s-db:\
./rRNA_databases/silva-euk-18s-id95.fasta,./index/silva-euk-18s-db:\
./rRNA_databases/silva-euk-28s-id98.fasta,./index/silva-euk-28s:\
./rRNA_databases/rfam-5s-database-id98.fasta,./index/rfam-5s-db:\
./rRNA_databases/rfam-5.8s-database-id98.fasta,./index/rfam-5.8s-db\ 
       --reads /data/output/test.fq --aligned /data/output/sortmerna/$TM \
       --log -v --other /data/output/sortmerna/$TM.norna --fastx

echo "RUNNING DIAMOND"
mkdir -p output/diamond
docker run --rm -v $HOME/ngs_pipe/:/data/ diamond blastx \
       -d /data/map/nr -q /data/output/DIS2_trimmed-R1.md.fq.gz -a /data/output/DIS2_trimmed-R1.daa \
       -p 4 -v -t /data/tmp

echo "RUNNING MEGAN"
mkdir -p output/megan
docker run --rm -v $HOME/ngs_pipe/:/data/ megan blast2lca \
       --input /data/output/diamond/$TM-R1.daa --format DAA --mode BlastX \
       -o /data/output/megan/$TM-R1.taxon -ko /data/output/megan/$TM-R1.ko -k -tid \
       -g2kegg /data/map/gi2kegg.map -g2t /data/map/gi2tax-Feb2016X.bin \
       > $HOME/ngs_pipe/output/megan/$TM.log 2>&1
