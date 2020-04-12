#!/usr/bin/env sh

set -e

massdns --resolvers /nameservers.txt --processes `nproc` -o S -q -w /tmp/r1 /d 2>/dev/null
massdns --resolvers /nameservers.txt --processes `nproc` -t AAAA -o S -q -w /tmp/r2 /d 2>/dev/null
echo -n > /tmp/massdns.txt && grep -hE ' CNAME | A | AAAA ' /tmp/r* | sort -u >> /tmp/massdns.txt 2>/dev/null
