# DIAMOND

FROM metabase

# RUN apt-get install -y wget

RUN wget http://github.com/bbuchfink/diamond/releases/download/v0.7.12/diamond-linux64.tar.gz
RUN tar xzf diamond-linux64.tar.gz && rm *.gz

ENTRYPOINT ["/diamond"]
CMD ["-h"]
VOLUME ["/data"]

