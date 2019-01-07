#!/usr/bin/env sh

set -e

apk --update --no-cache add gcc make libc-dev curl-dev wget ca-certificates
url='https://sourceforge.net/projects/dirb/files/dirb/2.22/dirb222.tar.gz/download'
file=`echo $url | awk -F '/' '{print $9}'`
cd /tmp/ && wget -q $url -O $file
tar xf $file && rm $file && cd dirb*
sh configure && make && make install
rm -r /tmp/dirb*
apk del wget
