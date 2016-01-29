#!/usr/bin/env bash
set -ex

BUILD_HS=http://172.17.0.1:8000
NODEJS_VERSION=4.2.6
NODEJS_DIST=node-v$NODEJS_VERSION-linux-x64.tar.gz

#mkdir /opt
cd /opt
curl -s $BUILD_HS/$NODEJS_DIST | tar xz
cd -

ln -s /opt/node-v$NODEJS_VERSION-linux-x64 /opt/nodejs
