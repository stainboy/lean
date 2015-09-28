# SAMBA Service

## Build the image
    docker build --no-cache=true -t samba:4.1.17 .

## Run the image
    docker run \
     -d --name smbd \
     -v ~/repo:/repo \
     --net=host \
     samba:4.1.17

