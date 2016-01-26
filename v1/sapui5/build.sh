#!/usr/bin/env bash

SAPUI5_VER='1.32.3'

if [ ! -f sapui5-local.tar ]; then
    curl -L http://10.58.136.166/assets/sapui5/$SAPUI5_VER/sapui5-$SAPUI5_VER.tar.lz4 | lz4 -d - sapui5-local.tar
fi
docker build --no-cache=true -t sapui5:$SAPUI5_VER .