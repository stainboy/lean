# How to use it?

    mkdir ~/.jenkins
    docker run -d --name jenkins \
     -e JENKINS_HOME=/.jenkins \
     -v /tmp:/tmp \
     -v ~/.jenkins:/.jenkins \
     -v /var/run/docker.sock:/var/run/docker.sock \
     -p 8000:8080 hyper.cd/core/jenkins-git:1.643

# Jenkins
http://jenkins-ci.org

# Docker universal binary
https://docs.docker.com/engine/installation/binaries/#get-the-linux-binary
https://get.docker.com/builds/Linux/x86_64/docker-1.8.3