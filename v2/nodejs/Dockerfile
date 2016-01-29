FROM hyper.cd/core/buildpack:1.0

# https://nodejs.org/dist/v4.2.6/node-v4.2.6-linux-x64.tar.gz
RUN curl -s http://172.17.0.1:8000/build.sh | bash

ENV NODE_HOME=/opt/nodejs \
    PATH=$PATH:/opt/nodejs/bin
