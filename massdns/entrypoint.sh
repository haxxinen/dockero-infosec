#!/usr/bin/env sh

set -e

massdns --resolvers /nameservers.txt --processes 4 -o S -q -w /tmp/r /d 2>/dev/null
echo -n > /r
grep -h ' A ' /tmp/r*  >> /r 2>/dev/null
grep -h ' AAAA ' /tmp/r* >> /r 2>/dev/null
grep -h ' CNAME ' /tmp/r* >> /r 2>/dev/null
