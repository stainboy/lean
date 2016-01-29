FROM hyper.cd/core/buildpack:1.0

RUN curl -s http://172.17.0.1:8000/build.sh | bash

#VOLUME ["/var/cache/nginx", "/etc/nginx"]
#EXPOSE 80 443
ENTRYPOINT ["nginx", "-g", "daemon off;"]
