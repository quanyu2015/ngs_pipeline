# building all images

docker build -t metabase - < tools/metabase/Dockerfile
docker build -t fastqc - < tools/fastqc/Dockerfile
docker build -t sortmerna - < tools/sortmerna/Dockerfile
docker build -t illumiprocessor - < tools/illumiprocessor/Dockerfile
docker build -t diamond - < tools/diamond/Dockerfile
docker build -t megan - < tools/megan/Dockerfile

