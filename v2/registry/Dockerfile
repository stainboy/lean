FROM hyper.cd/core/buildpack:1.0

RUN curl -s http://172.17.0.1:8000/build.sh | bash

ENTRYPOINT ["/opt/bin/registry", "/etc/registry/config.yaml"]
# EXPOSE 5000
# VOLUME /var/lib/registry
