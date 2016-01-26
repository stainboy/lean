FROM hyper.cd/core/jre:8u65

ADD jenkins.war docker fleetctl mc.pem /opt/

RUN \
    # http proxy
    # export http_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    # export https_proxy=http://proxy.pvgl.sap.corp:8080 &&\
    export DEBIAN_FRONTEND=noninteractive &&\
    # install
    { \
        # echo 'deb http://mirrors.163.com/debian/ jessie main'; \
        echo 'deb http://10.58.9.159/debian jessie main'; \
    } > /etc/apt/sources.list &&\
    apt-get update &&\
    apt-get install -y --force-yes --no-install-recommends curl ca-certificates openssh-client git liblz4-tool &&\
    apt-get clean autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* &&\
    # config ssh
    mkdir /root/.ssh &&\
    mv /opt/mc.pem /root/.ssh/id_rsa &&\
    chmod 400 /root/.ssh/id_rsa &&\
    echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config &&\
    # config docker
    mv /opt/docker /usr/bin/ &&\
    mv /opt/fleetctl /usr/bin/ &&\
    chmod +x /usr/bin/docker /usr/bin/fleetctl &&\
    # done
    echo 'done'


ENTRYPOINT ["java", "-Dhudson.diyChunking=false", "-Duser.timezone=Asia/Shanghai", "-jar", "/opt/jenkins.war"]

# EXPOSE 8080
# ENV JENKINS_HOME=/.jenkins
# VOLUME /.jenkins
# VOLUME /var/run/docker.sock
