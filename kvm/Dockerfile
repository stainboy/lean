FROM debian:jessie

RUN \
    # export http_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    # export https_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    export DEBIAN_FRONTEND=noninteractive &&\
    # install
    { \
        echo 'deb http://10.58.9.159/debian jessie main'; \
        # echo 'deb http://mirrors.163.com/debian/ jessie main non-free contrib'; \
        # echo 'deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib'; \
        # echo 'deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib'; \
        # echo 'deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib'; \
    } > /etc/apt/sources.list &&\
    apt-get update &&\
    apt-get install -y --force-yes --no-install-recommends kvm qemu-utils &&\
    apt-get clean autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/*

