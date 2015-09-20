FROM daocloud.io/library/ruby
# docker build --no-cache=true -t jekyll:2.4.0 .
#
# docker run -d --privileged --name stainboy -p 80:4000 -v ~/git/stainboy.github.io:/opt/web jekyll:2.4.0
# docker run -d --privileged --name pchou -p 81:4000 -v ~/git/pchou.github.io:/opt/web jekyll:2.4.0
#
ENV PATH=$PATH:/opt/node-v4.0.0-linux-x64/bin \
    NODE_HOME=/opt/node-v4.0.0-linux-x64/

RUN \
    # http proxy
    # export http_proxy=http://proxy.sin.sap.corp:8080 &&\
    # export https_proxy=http://proxy.sin.sap.corp:8080 &&\
    # download nodejs
    curl -sLO https://nodejs.org/dist/v4.0.0/node-v4.0.0-linux-x64.tar.gz &&\
    tar -xf /node-v4.0.0-linux-x64.tar.gz -C /opt/ &&\
    rm /node-v4.0.0-linux-x64.tar.gz &&\
    # install bundle
    gem install bundle &&\
    # install taobao github-pages
    { \
        echo "source 'http://ruby.taobao.org'"; \
        echo "gem 'github-pages'"; \
    } > Gemfile &&\
    bundle install &&\
    # done
    echo 'done'

# EXPOSE 4000

ENTRYPOINT ["jekyll", "serve", "-s", "/opt/web"]
