#!/usr/bin/env bash
set -ex

BUILD_HS=http://172.17.0.1:8000
GROOVY_VERSION=2.4.5
GROOVY_DIST=groovy-$GROOVY_VERSION.tar

#mkdir /opt
cd /opt
curl -s $BUILD_HS/$GROOVY_DIST | tar x
cd -

ln -s /opt/groovy-$GROOVY_VERSION /opt/groovy

curl -s -o /opt/groovy/lib/jsoup-1.8.3.jar http://172.17.0.1:8000/jsoup-1.8.3.jar

