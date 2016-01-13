#!/usr/bin/env bash
set -e

MAVEN_VER='3.3.9'

if [ ! -f apache-maven-$MAVEN_VER-bin.tar.gz ]; then
    export https_proxy=http://proxy.pal.sap.corp:8080
    export http_proxy=http://proxy.pal.sap.corp:8080
    curl -LO http://apache.mirrors.ionfish.org/maven/maven-3/$MAVEN_VER/binaries/apache-maven-$MAVEN_VER-bin.tar.gz
fi
docker build --no-cache=true -t hyper.cd/core/maven:$MAVEN_VER .

