FROM hyper.cd/core/debian:jessie

# MAINTAINER NGINX Docker Maintainers "docker-maint@nginx.com"

RUN \
    export NGINX_VERSION=1.9.7-1~jessie &&\
    # http proxy
    export http_proxy=http://proxy.wdf.sap.corp:8080 &&\
    export https_proxy=http://proxy.wdf.sap.corp:8080 &&\
    export DEBIAN_FRONTEND=noninteractive &&\
    #
    apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 &&\
    echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list &&\
    apt-get update &&\
    apt-get install -y --force-yes --no-install-recommends ca-certificates nginx=${NGINX_VERSION} &&\
    apt-get clean autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* &&\
    # forward request and error logs to docker log collector
    mkdir -p /var/log/nginx &&\
    touch /var/log/nginx/access.log /var/log/nginx/error.log &&\
    ln -sf /dev/stdout /var/log/nginx/access.log &&\
    ln -sf /dev/stderr /var/log/nginx/error.log &&\
    #
    echo 'done'


#VOLUME ["/var/cache/nginx", "/etc/nginx"]
#EXPOSE 80 443
ENTRYPOINT ["nginx", "-g", "daemon off;"]