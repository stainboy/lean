FROM debian:jessie
# docker build --no-cache=true -t nodejs:4.0.0 .
#
# docker run --rm --name node-playground -it nodejs:4.0.0 node
#

ENV PATH=$PATH:/opt/node-v4.0.0-linux-x64/bin \
    NODE_HOME=/opt/node-v4.0.0-linux-x64/

RUN \
    # http proxy
    export http_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    export https_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    # add 163 mirror
    { \
        echo 'deb http://mirrors.163.com/debian/ jessie main non-free contrib'; \
        echo 'deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib'; \
        echo 'deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib'; \
        echo 'deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib'; \
    } > /etc/apt/sources.list &&\
    apt-get update &&\
    apt-get install -y --force-yes curl &&\
    apt-get clean autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* &&\
    # download nodejs
    curl -sLO https://nodejs.org/dist/v4.0.0/node-v4.0.0-linux-x64.tar.gz &&\
    tar -xf /node-v4.0.0-linux-x64.tar.gz -C /opt/ &&\
    rm /node-v4.0.0-linux-x64.tar.gz &&\
    # done
    echo 'done'