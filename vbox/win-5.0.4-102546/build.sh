#!/usr/bin/env bash
set -e

pushd bin
if [ ! -f VirtualBox-5.0.4-102546-Win.exe ]; then
    curl -sLO http://download.virtualbox.org/virtualbox/5.0.4/VirtualBox-5.0.4-102546-Win.exe
fi
cat SHA256SUMS | grep 'VirtualBox-5.0.4-102546-Win.exe' | sha256sum -c -
popd

docker build --no-cache=true -t index.alauda.cn/yydev/vbox:win-5.0.4-102546 .