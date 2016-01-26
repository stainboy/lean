FROM debian:jessie

RUN \
    # http proxy
    # export http_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    # export https_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    # install
    export DEBIAN_FRONTEND=noninteractive &&\
    { \
        # echo 'deb http://mirrors.163.com/debian/ jessie main'; \
        echo 'deb http://10.58.9.159/debian jessie main'; \
    } > /etc/apt/sources.list &&\
    apt-get update &&\
    apt-get install -y --force-yes --no-install-recommends genisoimage &&\
    apt-get clean autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* &&\
    # symbolic link
    ln -s /usr/bin/genisoimage /usr/bin/mkisofs &&\
    # done
    echo 'done'

# docker build --no-cache=true -t genisoimage:1.1.11 .