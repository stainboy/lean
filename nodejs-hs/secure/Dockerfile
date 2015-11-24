FROM nodejs-hs-insecure:0.8.0
# docker build --no-cache=true -t nodejs-hs:0.8.0 .
#
# docker run -d --name nodejs-hs -p 443:443 -v /path/to/web:/opt/web nodejs-hs:0.8.0
#

ADD *.pem /etc/cert/

ENTRYPOINT ["hs", "-p", "443", "-S", "-C", "/etc/cert/pvgl.sap.corp.pem", "-K", "/etc/cert/key.pem", "/opt/web"]
# EXPOSE 443
# VOLUME /opt/web