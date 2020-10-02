#!/usr/bin/env bash

pass='/tmp/pass.txt'
ip='127.0.0.1'
ignore='STATUS_LOGON_FAILURE' # Win7

docker run --rm -it -v $pass:/F0 \
patator smb_login host=$ip user="test" password=FILE0 0=/F0 \
-x ignore:fgrep="$ignore" -t 5
