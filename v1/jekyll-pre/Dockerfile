FROM debian:jessie

ADD ruby-jekyll-bundle.tar.xz /usr/local/

ENV PATH=$PATH:/usr/local/bundle/bin \
    BUNDLE_APP_CONFIG=/usr/local/bundle \
    GEM_HOME=/usr/local/bundle \
    RUBY_MAJOR=2.2 \
    RUBY_VERSION=2.2.3 \
    RUBYGEMS_VERSION=2.4.8 \
    BUNDLER_VERSION=1.10.6

RUN \
    export DEBIAN_FRONTEND=noninteractive &&\
    { \
        # echo 'deb http://mirrors.163.com/debian/ jessie main'; \
        echo 'deb http://10.58.9.159/debian jessie main'; \
    } > /etc/apt/sources.list &&\
    apt-get update &&\
    apt-get install -y --force-yes --no-install-recommends libffi6 libcrypto++9 libssl1.0.0 libyaml-0-2 libgdbm3 &&\
    apt-get install -y --force-yes --no-install-recommends liblz4-tool &&\
    apt-get install -y --force-yes curl &&\
    apt-get clean autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* &&\
    echo 'done'

# CMD jekyll serve --source /workspace/src --host 0.0.0.0
# EXPOSE 4000
# VOLUME /workspace/src
# VOLUME /workspace/dest
