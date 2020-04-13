#!/usr/bin/env sh

set -e
apk --update --no-cache add git make gcc libc-dev

wget https://public-dns.info/nameservers.txt -O /nameservers.txt

git clone https://github.com/blechschmidt/massdns /tmp/massdns
cd /tmp/massdns && make && mv bin/massdns /bin/massdns
rm -r /tmp/massdns
touch $results
