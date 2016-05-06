############################################################
# Dockerfile to build FASTQC container images
# Based on Ubuntu
# adapt from
# http://pythonwise.blogspot.sg/2015/04/docker-miniconda-perfect-match.html
############################################################

# Set the base image to Ubuntu
FROM metabase

# File Author / Maintainer
MAINTAINER QUAN YU <lsiqyu@nus.edu.sg>

# Update the repository sources list
# RUN apt-get update
RUN apt-get install -y bzip2 git 

# Install OpenJDK 7 JRE
# RUN apt-get install --yes openjdk-7-jre-headless perl unzip

# Download
RUN wget -nv https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
RUN bash Miniconda2-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda2-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda

# RUN conda install illumiprocessor
RUN conda install -yc https://conda.anaconda.org/faircloth-lab illumiprocessor

# update the core.py file so that more adapter sequences can be processed
# ref: http://bioinformatics.cvr.ac.uk/blog/illumina-adapter-and-primer-sequences/
RUN git clone https://github.com/etheleon/illumiprocessor.git
RUN cp /illumiprocessor/illumiprocessor/core.py /miniconda/pkgs/illumiprocessor-2.0.7-py27_1/lib/python2.7/site-packages/illumiprocessor/
RUN conda list

# shared folders
VOLUME ["/data", "/config"]
ENTRYPOINT ["illumiprocessor"]
CMD ["-h"]
