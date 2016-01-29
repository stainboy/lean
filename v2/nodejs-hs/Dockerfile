FROM hyper.cd/core/nodejs:4.2.6

RUN curl -s http://172.17.0.1:8000/build.sh | bash

ENTRYPOINT ["hs", "-p", "80", "/opt/web"]
# EXPOSE 80
# VOLUME /opt/web
