#!/usr/bin/env bash

set -e
v='2.4.4'

apt-get update -qq && apt-get install -yqq --no-install-recommends --no-install-suggests \
wget ca-certificates adb default-jre

cd /tmp
wget "https://github.com/mwrlabs/drozer/releases/download/$v/drozer_$v.deb"
dpkg -i "drozer_$v.deb" 2>/dev/null
apt-get -f install  -yqq --no-install-recommends --no-install-suggests
rm "drozer_$v.deb"
