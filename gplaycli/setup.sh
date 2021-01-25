#!/usr/bin/env sh
set -e

apk --update --no-cache add python3-dev py3-pip \
gcc make musl-dev libffi-dev libxml2-dev libxslt-dev openssl-dev

pip3 install --upgrade pip
pip3 install gplaycli

mkdir /etc/gplaycli
wget https://raw.githubusercontent.com/matlink/gplaycli/master/gplaycli.conf \
-O /etc/gplaycli/gplaycli.conf

# fixes a bug in gpapi logging -_-
f=`find / -name googleplay.py | grep gpapi`
[[ ! -e $f ]] && echo 'Missing gpapi?'
l=`grep -n self.log $f | awk -F ':' '{print $1}'`
for i in $l; do sed -i $i's/^/#/' $f; done

# running a smoke test
echo 'Buckle up, am running a smoke test!'
apk='com.google.android.apps.maps'
gplaycli -d $apk -f /tmp/ >/dev/null 2>/dev/null
[[ -e "/tmp/$apk.apk" ]] && echo 'All good!' && rm "/tmp/$apk.apk"
