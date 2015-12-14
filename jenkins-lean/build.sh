#!/usr/bin/env bash

JENKINS_VER='1.641'
DOCKER_VER='1.8.3'

if [ ! -f jenkins.war ]; then
    export https_proxy=http://proxy.wdf.sap.corp:8080
    export http_proxy=http://proxy.wdf.sap.corp:8080
    curl -LO http://mirrors.jenkins-ci.org/war/$JENKINS_VER/jenkins.war
    curl -LO https://get.docker.com/builds/Linux/x86_64/docker-$DOCKER_VER
    mv docker-$DOCKER_VER docker
fi
docker build --no-cache=true -t hyper.cd/core/jenkins:$JENKINS_VER .