# SortMeRNA
# https://github.com/biocore/sortmerna/blob/master/README.md

FROM metabase

# RUN apt-get install gcc-4.9

# version 1
# ADD https://github.com/biocore/sortmerna/archive/2.1.tar.gz /tmp
# RUN tar -xvf /tmp/sortmerna-2.1.tar.gz
# WORKDIR /tmp/sortmernatar
# RUN bash ./build.sh && make install


RUN wget -P /tmp http://bioinfo.lifl.fr/RNA/sortmerna/code/sortmerna-2.1-linux-64.tar.gz
RUN tar -xvf /tmp/sortmerna-2.1-linux-64.tar.gz && rm /tmp/*.gz
WORKDIR /sortmerna-2.1-linux-64/

RUN ./indexdb_rna --ref ./rRNA_databases/silva-bac-16s-id90.fasta,./index/silva-bac-16s-db:\
./rRNA_databases/silva-bac-23s-id98.fasta,./index/silva-bac-23s-db:\
./rRNA_databases/silva-arc-16s-id95.fasta,./index/silva-arc-16s-db:\
./rRNA_databases/silva-arc-23s-id98.fasta,./index/silva-arc-23s-db:\
./rRNA_databases/silva-euk-18s-id95.fasta,./index/silva-euk-18s-db:\
./rRNA_databases/silva-euk-28s-id98.fasta,./index/silva-euk-28s:\
./rRNA_databases/rfam-5s-database-id98.fasta,./index/rfam-5s-db:\
./rRNA_databases/rfam-5.8s-database-id98.fasta,./index/rfam-5.8s-db

ENTRYPOINT ["./sortmerna"]
CMD ["-h"]

