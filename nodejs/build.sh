#!/usr/bin/env bash

NODEJS_VER='4.2.1'

if [ ! -f node-v$NODEJS_VER-linux-x64.tar.gz ]; then
    curl -LO https://nodejs.org/dist/v$NODEJS_VER/node-v$NODEJS_VER-linux-x64.tar.gz
fi
docker build --no-cache=true -t nodejs:$NODEJS_VER .