#################################################################
# Dockerfile
#
# Version:          0.0.1
# Software:         newbler
# Software Version: 0.0.2
# Description:      A gene centric metagenomics assembly and annotation pipeline
# Website:          https://github.com/etheleon/pAss
# Tags:             Genomics Metagenomics
# Base Image:       ubuntu:latest 
# Run Cmd:          docker run <image> -v $HOME/contigs:/data/contigs -v $HOME/refSeqProtDB:/data/refSeqProfDB -v $HOME/out:/data/out maxDiversity  
#################################################################

FROM ubuntu:16.04

RUN apt-get update 
RUN apt-get install -y rpm2cpio
RUN apt-get install -y cpio

VOLUME ["/data]

#################### INSTALLATION ENDS ##############################
MAINTAINER Wesley GOI <picy2k@gmail.com>
