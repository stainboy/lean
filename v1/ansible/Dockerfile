FROM hyper.cd/core/debian:jessie

RUN \
    # http proxy
    export http_proxy=http://proxy.wdf.sap.corp:8080 &&\
    export https_proxy=http://proxy.wdf.sap.corp:8080 &&\
    # install
    export DEBIAN_FRONTEND=noninteractive &&\
    # { \
    #     echo 'deb http://mirrors.163.com/debian/ jessie main'; \
    #     # echo 'deb http://10.58.9.159/debian jessie main'; \
    # } > /etc/apt/sources.list &&\
    apt-get update &&\
    apt-get install -y --force-yes --no-install-recommends python-crypto python-pip &&\
    apt-get clean autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* &&\
    # symbolic link
    pip install httplib2 ansible && \
    # disable host key checking
    { \
        echo '[defaults]'; \
        echo 'host_key_checking = False'; \
    } > ~/.ansible.cfg &&\
    # done
    echo 'done'

# docker build --no-cache=true -t hyper.cd/core/ansible:1.9.4 .
