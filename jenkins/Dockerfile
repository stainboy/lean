FROM jre:8u60

ADD jenkins.war docker-engine_1.8.1-0~jessie_amd64.deb /opt/
ADD fin.pem /root/.ssh/id_rsa

# Install git, docker
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
    apt-get install -y --force-yes curl &&\
    apt-get install -y --force-yes --no-install-recommends openssh-client git sudo iptables init-system-helpers perl libapparmor1 libsqlite3-0 liblz4-tool &&\
    apt-get clean autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* &&\
    #
    dpkg -i /opt/docker-engine_1.8.1-0~jessie_amd64.deb &&\
    rm /opt/docker-engine_1.8.1-0~jessie_amd64.deb &&\
    # docker version &&\
    #
    chmod 400 /root/.ssh/id_rsa &&\
    echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config &&\
    # done
    echo 'done'


ENTRYPOINT ["java", "-Dhudson.diyChunking=false", "-jar", "/opt/jenkins.war"]

# EXPOSE 8080
# ENV JENKINS_HOME=/.jenkins
# VOLUME /.jenkins
# VOLUME /var/run/docker.sock
