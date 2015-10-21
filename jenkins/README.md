# How to use it?

    mkdir ~/.jenkins
    docker run -d --name jenkins \
     -e JENKINS_HOME=/.jenkins \
     -v /tmp:/tmp \
     -v ~/.jenkins:/.jenkins \
     -v /var/run/docker.sock:/var/run/docker.sock \
     -p 8000:8080 jenkins:1.634

