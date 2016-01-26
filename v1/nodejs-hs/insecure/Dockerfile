FROM nodejs:4.2.2
# docker build --no-cache=true -t nodejs-hs-insecure:0.8.0 .
#
# docker run -d --name nodejs-hs -p 80:80 -v /path/to/web:/opt/web nodejs-hs-insecure:0.8.0
#

RUN \
    # http proxy
    # export http_proxy=http://proxy.wdf.sap.corp:8080 &&\
    # export https_proxy=http://proxy.wdf.sap.corp:8080 &&\
    # install http-server
    npm install -g http-server &&\
    # done
    echo 'done'

ENTRYPOINT ["hs", "-p", "80", "/opt/web"]
# EXPOSE 80
# VOLUME /opt/web