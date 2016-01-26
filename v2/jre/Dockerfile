FROM hyper.cd/core/buildpack:1.0

RUN curl -s http://172.17.0.1:8000/build.sh | bash

ENV PATH=$PATH:/opt/jre/bin \
    JAVA_HOME=/opt/jre
