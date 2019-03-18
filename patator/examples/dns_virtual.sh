#!/usr/bin/env bash

list='/tmp/subdomains.txt'
url='https://127.0.0.1'
domain='example.com'
ignore='The document has moved' # Apache

docker run --rm -it -v $list:/F0 \
patator http_fuzz url="$url" \
header="Host:FILE0.$domain" 0=/F0 \
-x ignore:fgrep="$ignore" --threads=20

# similar to
# http http://10.10.10.113 Host:<word>.example.com
