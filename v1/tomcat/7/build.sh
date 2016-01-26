#!/usr/bin/env bash
set -ex

TOMCAT_VER='7.0.67'

if [ ! -f tomcat.tar ]; then
    export http_proxy=http://proxy.pal.sap.corp:8080
    export https_proxy=http://proxy.pal.sap.corp:8080
    curl -o tomcat.tar.gz -L http://www.motorlogy.com/apache/tomcat/tomcat-7/v$TOMCAT_VER/bin/apache-tomcat-$TOMCAT_VER.tar.gz
    tar xf tomcat.tar.gz
    mv apache-tomcat-$TOMCAT_VER tomcat
    tar cf tomcat.tar tomcat/
fi
docker build --no-cache=true -t hyper.cd/core/tomcat:$TOMCAT_VER .



