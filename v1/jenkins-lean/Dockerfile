FROM hyper.cd/core/jre:8u65

ADD * /opt/

RUN \
    #
    mv /opt/docker /usr/bin/ &&\
    chmod +x /usr/bin/docker &&\
    # done
    echo 'done'


ENTRYPOINT ["java", "-Duser.timezone=Asia/Shanghai", "-jar", "/opt/jenkins.war"]

# EXPOSE 8080
# ENV JENKINS_HOME=/.jenkins
# VOLUME /.jenkins
# VOLUME /var/run/docker.sock
