#!/usr/bin/env bash
set -ex

TOMCAT_VER='6.0.44'
docker build --no-cache=true -t hyper.cd/core/tomcat:$TOMCAT_VER .



