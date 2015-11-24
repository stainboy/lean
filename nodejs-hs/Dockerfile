FROM nodejs:4.2.2
# docker build --no-cache=true -t nodejs-hs:0.8.0 .
#
# docker run -d --name nodejs-hs -p 443:443 -v /path/to/web:/opt/web nodejs-hs:0.8.0
#

ADD *.pem /etc/cert/

RUN \
    # http proxy
    # export http_proxy=http://proxy.wdf.sap.corp:8080 &&\
    # export https_proxy=http://proxy.wdf.sap.corp:8080 &&\
    # install http-server
    npm install -g http-server &&\
    # done
    echo 'done'

ENTRYPOINT ["hs", "-p", "443", "-S", "-C", "/etc/cert/pvgl.sap.corp.pem", "-K", "/etc/cert/key.pem", "/opt/web"]
# EXPOSE 443 80