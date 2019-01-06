#!/usr/bin/env bash

list='/tmp/subdomains.txt'
name='FILE0.example.com'

docker run --rm -it -v $list:/F0 \
patator dns_forward name=$name 0=/F0 \
-x ignore:code=3 --max-retries=2 \
--timeout=3 --rate-limit=1 --threads=50
