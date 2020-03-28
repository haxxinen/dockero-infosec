#!/usr/bin/env sh

set -e

massdns --resolvers /nameservers.txt --processes 4 -o S -q -w /tmp/r1 /d 2>/dev/null
massdns --resolvers /nameservers.txt --processes 4 -t AAAA -o S -q -w /tmp/r2 /d 2>/dev/null
echo -n > /r && grep -hE ' CNAME | A | AAAA ' /tmp/r* | sort -u >> /r 2>/dev/null
