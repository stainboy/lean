FROM hyper.cd/core/jre:8u72

RUN curl -s http://172.17.0.1:8000/build.sh | bash

ENV GROOVY_HOME=/opt/groovy \
    PATH=$PATH:/opt/groovy/bin
