#!/usr/bin/env bash

set -e

apt-get update -qq && apt-get install -yqq --no-install-recommends --no-install-suggests \
git wget unzip build-essential ca-certificates apt-utils python3-setuptools \
libcurl4-openssl-dev python3-dev python3-pip libssl-dev ldap-utils ike-scan default-jdk \
libsqlite3-dev libsqlcipher-dev default-libmysqlclient-dev \
git-core cmake xsltproc libx11-dev libxext-dev libxinerama-dev \
libxcursor-dev libxdamage-dev libxv-dev libxkbfile-dev libasound2-dev libcups2-dev \
libxml2 libxml2-dev libxrandr-dev libxi-dev libgstreamer-plugins-base1.0-dev libusb-dev libusb-1.0-0-dev

pip install pyopenssl pyasn1 impacket pysqlcipher3 pyopenssl mysqlclient==1.3.12

git clone https://github.com/FreeRDP/FreeRDP/ /tmp/FreeRDP
cd /tmp/FreeRDP && cmake -DCMAKE_BUILD_TYPE=Debug -DWITH_SSE2=ON . && make && make install

git clone https://github.com/lanjelot/patator /tmp/patator
cd /tmp/patator && pip3 install -r requirements.txt && python3 setup.py build install

rm -r /tmp/FreeRDP
rm -r /tmp/patator
