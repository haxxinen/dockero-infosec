#!/usr/bin/env sh

set -e

apk --update --no-cache add python3-dev py3-pip git gcc \
make readline-dev ncurses-dev musl-dev libffi-dev openssl-dev rust cargo

pip install --upgrade pip

cd && git clone https://github.com/epinna/weevely3 && cd weevely3
pip3 install -r requirements.txt
