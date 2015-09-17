#!/usr/bin/env bash

if [ ! -f node-v4.0.0-linux-x64.tar.gz ]; then
    curl -LO https://nodejs.org/dist/v4.0.0/node-v4.0.0-linux-x64.tar.gz
fi
docker build --no-cache=true -t nodejs:4.0.0 .