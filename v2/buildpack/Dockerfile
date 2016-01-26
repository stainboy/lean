FROM scratch

# https://github.com/tianon/docker-brew-debian/blob/0a2d20ca8e26f7bf6a5cc3ce2727eb6cc1894ef9/jessie/rootfs.tar.xz
ADD rootfs.tar.xz /

RUN \
    # http proxy
    export http_proxy=http://proxy.pal.sap.corp:8080 &&\
    export https_proxy=http://proxy.pal.sap.corp:8080 &&\
    export DEBIAN_FRONTEND=noninteractive &&\
    apt-get update &&\
    apt-get install -y --force-yes --no-install-recommends \
     unzip curl ca-certificates liblz4-tool p7zip-full net-tools &&\
    apt-get clean autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* &&\
    unset http_proxy https_proxy &&\
    # import sap_root_ca
    curl -s -o /etc/ssl/certs/sap_root_ca.pem http://172.17.0.1:8000/sap_root_ca.pem &&\
    update-ca-certificates --fresh &&\
    # test
    curl -i -s https://media.hypercd.sapanywhere.sap.corp | head &&\
    # done
    echo 'done'


CMD ["/bin/bash"]
