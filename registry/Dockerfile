FROM hyper.cd/core/debian:jessie

ADD stuff/* /opt/bin/

ENV REGISTRY_HTTP_TLS_CERTIFICATE=/etc/ssl/certs/hypercd.crt \
    REGISTRY_HTTP_TLS_KEY=/etc/ssl/certs/hypercd.key

RUN \
    # export http_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    # export https_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    export DEBIAN_FRONTEND=noninteractive &&\
    # install
    { \
        echo 'deb http://10.58.9.159/debian jessie main'; \
        # echo 'deb http://mirrors.163.com/debian/ jessie main'; \
    } > /etc/apt/sources.list &&\
    apt-get update &&\
    apt-get install -y --force-yes --no-install-recommends ca-certificates librados2 apache2-utils &&\
    apt-get clean autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* &&\
    # configure registry
    mkdir /etc/registry &&\
    mv /opt/bin/config.yaml /etc/registry/ &&\
    # ssl
    mv /opt/bin/hypercd.crt /etc/ssl/certs/ &&\
    mv /opt/bin/hypercd.key /etc/ssl/certs/ &&\
    #
    echo 'done'


ENTRYPOINT ["/opt/bin/registry", "/etc/registry/config.yaml"]
# EXPOSE 443
# VOLUME /var/lib/registry