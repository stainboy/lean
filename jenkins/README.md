# How to use it?

    mkdir ~/.jenkins
    docker run -d --name jenkins \
     -e JENKINS_HOME=/.jenkins \
     -v /tmp:/tmp \
     -v ~/.jenkins:/.jenkins \
     -v /var/run/docker.sock:/var/run/docker.sock \
     -p 8000:8080 jenkins:1.638

# Debian repo
https://apt.dockerproject.org/repo/dists/debian-jessie/main/
https://apt.dockerproject.org/repo/pool/main/d/docker-engine/
https://apt.dockerproject.org/repo/pool/main/d/docker-engine/docker-engine_1.8.3-0~jessie_amd64.deb
https://apt.dockerproject.org/repo/pool/main/d/docker-engine/docker-engine_1.9.0-0~jessie_amd64.deb