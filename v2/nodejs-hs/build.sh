#!/usr/bin/env bash
set -ex

# http proxy
export http_proxy=http://proxy.pal.sap.corp:8080
export https_proxy=http://proxy.pal.sap.corp:8080

# install http-server
npm install -g http-server
