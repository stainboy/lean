FROM debian:jessie
# docker build --no-cache=true -t nodejs:0.12.7 .
#
# docker run --rm --name node-playground -it nodejs:0.12.7 node
# docker run -d --name node-hs -p 80:80 -v /path/to/web:/media:ro nodejs:0.12.7 hs -d false -p 80 /media

ENV PATH=$PATH:/opt/nodejs/bin \
    NODE_HOME=/opt/nodejs

ADD nodejs.tar.xz /opt/