FROM debian:jessie
# docker build --no-cache=true -t curl .
#


RUN \
    # http proxy
    # export http_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    # export https_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    # install haproxy
    { \
        echo 'deb http://mirrors.163.com/debian/ jessie main'; \
    } > /etc/apt/sources.list &&\
    apt-get update &&\
    # test purpose, remove it later
    # apt-get install -y --force-yes --no-install-recommends net-tools vim curl wget file &&\
    apt-get install -y --force-yes curl &&\
    apt-get clean autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* &&\
    # done
    echo 'done'

# VOLUME /etc/haproxy/haproxy.cfg

# EXPOSE 3306 3307 5672 15672 9000