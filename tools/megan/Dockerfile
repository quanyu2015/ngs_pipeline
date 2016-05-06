# Build image with:  docker build -t krizsan/ubuntu1504java8:v1 .
 
FROM ubuntu:14.04
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get clean

WORKDIR /tmp

# RUN wget -P /tmp http://ab.inf.uni-tuebingen.de/data/software/megan5/download/MEGAN_unix_5_11_3.sh
# RUN wget -nv http://ab.inf.uni-tuebingen.de/data/software/megan6/download/MEGAN_Community_unix_6_3_6.sh
# RUN wget -nv http://ab.inf.uni-tuebingen.de/data/software/megan6/download/MEGAN_Ultimate_unix_6_3_7.sh
RUN wget -nv http://ab.inf.uni-tuebingen.de/data/software/megan6/download/MEGAN_Ultimate_unix_6_3_9.sh
COPY megan_install_v6 /tmp
# RUN bash MEGAN_Ultimate_unix_6_3_7.sh < /tmp/megan_install_v6
RUN bash MEGAN_Ultimate_unix_6_3_9.sh < /tmp/megan_install_v6

# COPY ./url_list.txt /tmp
# RUN wget -nv -i url_list.txt
# RUN unzip '/tmp/*.zip' && rm /tmp/*.zip

# ENTRYPOINT ["MEGAN"]
# CMD ["-h"]
# COPY data.jar /usr/local/megan/jars/
VOLUME ["/data"]
ENV PATH=/usr/local/megan/tools:${PATH}

