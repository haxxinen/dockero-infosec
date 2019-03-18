#!/usr/bin/env bash

pass='/tmp/passwords.txt'
ip='127.0.0.1'
user='admin'
ignore='Authentication failed.'

docker run --rm -it -v $pass:/F0 \
patator ssh_login host=$ip \
user=$user password=FILE0 0=/F0 \
-x ignore:mesg="$ignore" \
--threads 15
