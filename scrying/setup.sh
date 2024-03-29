#!/usr/bin/env bash

apt-get update && apt-get install wget -yqq
cd /tmp

# install scrying & depends
wget https://github.com/nccgroup/scrying/releases/download/v0.9.2/scrying_0.9.2_amd64.deb
dpkg -i scrying_0.9.2_amd64.deb 2>/dev/null
apt-get install -f -yqq

# fix libssl depends ¯\_(ツ)_/¯
wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb

# some cleanup LOL
rm *.deb
