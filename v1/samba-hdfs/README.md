# SAMBA Service

## Build the image
    docker build --no-cache=true -t hyper.cd/core/samba-hdfs:4.1.17 .

## Run the image
    docker run \
     -d --name smbd-hdfs \
     -v ~/.hdfs-bk:/hdfs-backup \
     --net=host \
     hyper.cd/core/samba-hdfs:4.1.17

