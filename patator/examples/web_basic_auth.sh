#!/usr/bin/env bash

pass='/tmp/pass.txt'
url='https://127.0.0.1/login'
ignore='Invalid password!'

docker run --rm -it -v $pass:/F0 \
patator http_fuzz url=$url auth_type=basic \
user_pass='FILE0:FILE1' 0=/F0 1=/F1 \
-x ignore:fgrep="$ignore" --threads=10
