############################################################
# Dockerfile to build FASTQC container images
# Based on Ubuntu
# adapt from
# https://github.com/GenomicParisCentre/dockerfiles/blob/master/fastqc/fastqc-0.11.3/Dockerfile
############################################################

# Set the base image to Ubuntu
FROM metabase

# File Author / Maintainer
MAINTAINER QUAN YU <lsiqyu@nus.edu.sg>

# Update the repository sources list
# RUN apt-get update && apt-get install --yes openjdk-7-jre-headless perl unzip
# RUN apt-get install --yes wget

# Download FastQC
# ADD http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip /tmp/
RUN wget -nv -P /tmp http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip

# Install FastQC
RUN unzip /tmp/fastqc_*.zip
RUN chmod 755 /FastQC/fastqc
RUN ln -s /FastQC/fastqc /usr/local/bin/fastqc

# Cleanup
RUN rm -rf /tmp/fastqc_*.zip

# shared folders
RUN mkdir /data /config
VOLUME ["/data", "/config"]
# WORKDIR /data

ENTRYPOINT ["fastqc"]
CMD ["--help"]
