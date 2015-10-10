FROM debian:jessie

RUN \
    # add user and group
    groupadd -r -g 500 core && useradd -r -g core -u 500 core &&\
    # http proxy
    # export http_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    # export https_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    export DEBIAN_FRONTEND=noninteractive &&\
    # install
    { \
        # echo 'deb http://mirrors.163.com/debian/ jessie main'; \
        echo 'deb http://10.58.9.159/debian jessie main'; \
    } > /etc/apt/sources.list &&\
    apt-get update &&\
    apt-get install -y --force-yes corkscrew openssh-client net-tools &&\
    apt-get clean autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* &&\
    # done
    echo 'done'

# docker build --no-cache=true -t ssh .
