#!/usr/bin/env bash
set -ex

BUILD_HS=http://172.17.0.1:8000
export http_proxy=http://proxy.pal.sap.corp:8080
export https_proxy=http://proxy.pal.sap.corp:8080
export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y --force-yes --no-install-recommends ca-certificates librados2 apache2-utils
apt-get clean autoclean
rm -rf /var/lib/apt/lists/*
rm -rf /var/log/*

unset http_proxy https_proxy

mkdir /etc/registry
mkdir /opt/registry

curl -s -o /etc/registry/config.yaml http://172.17.0.1:8000/config.yaml
curl -s -o /opt/registry/registry http://172.17.0.1:8000/registry

chmod +x /opt/registry/registry
