#!/usr/bin/env bash

if [ ! -f jetty-distribution-9.3.3.v20150827.tar.gz ]; then
    curl -LO http://download.eclipse.org/jetty/stable-9/dist/jetty-distribution-9.3.3.v20150827.tar.gz
fi
docker build --no-cache=true -t jetty:9.3.3 .