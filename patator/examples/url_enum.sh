#!/usr/bin/env bash

list='/tmp/list.txt'
url='http://127.0.0.1'

docker run --rm -i -v $list:/F0 \
patator http_fuzz url="$url/FILE0" 0=/F0 \
follow=0 accept_cookie=1 \
-x ignore:code=404 \
--threads 50
