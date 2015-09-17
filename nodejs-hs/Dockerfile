FROM nodejs:4.0.0
# docker build --no-cache=true -t nodejs-hs:0.8.0 .
#
# docker run -d --name nodejs-hs -p 80:8080 -v /path/to/web:/opt/web:ro nodejs-hs:0.8.0
#

RUN \
    # http proxy
    # export http_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    # export https_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    # install http-server
    npm install -g http-server &&\
    # done
    echo 'done'

ENTRYPOINT ["hs", "/opt/web"]