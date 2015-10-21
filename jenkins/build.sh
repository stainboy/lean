#!/usr/bin/env bash

JENKINS_VER='1.634'

if [ ! -f jenkins.war ]; then
    export https_proxy=http://proxy.wdf.sap.corp:8080
    export http_proxy=http://proxy.wdf.sap.corp:8080
    curl -LO http://mirrors.jenkins-ci.org/war/1.634/jenkins.war
fi
docker build --no-cache=true -t jenkins:$JENKINS_VER .