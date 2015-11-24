#!/usr/bin/env bash

JENKINS_VER='1.638'
DOCKER_VER='1.8.3'

if [ ! -f jenkins.war ]; then
    curl -LO http://10.58.136.166/amd64-usr/815.0.0/fin.pem
    export https_proxy=http://proxy.wdf.sap.corp:8080
    export http_proxy=http://proxy.wdf.sap.corp:8080
    curl -LO http://mirrors.jenkins-ci.org/war/$JENKINS_VER/jenkins.war
    curl -LO https://apt.dockerproject.org/repo/pool/main/d/docker-engine/docker-engine_$DOCKER_VER-0~jessie_amd64.deb
    mv "docker-engine_${DOCKER_VER}-0~jessie_amd64.deb" docker-engine_jessie_amd64.deb
fi
docker build --no-cache=true -t jenkins:$JENKINS_VER .