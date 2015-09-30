#!/usr/bin/env bash

if [ ! -f sapui5-1.32.0.tar ]; then
    curl -sL http://10.58.136.166/assets/sapui5-1.32.0.tar.lz4 | lz4 -d - sapui5-1.32.0.tar
fi
docker build --no-cache=true -t sapui5:1.32.0 .