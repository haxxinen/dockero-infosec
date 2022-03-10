#!/usr/bin/env sh

set -e

apk --update --no-cache add python3 python3-dev py3-pip curl-dev gcc musl-dev git
pip3 install --upgrade pip setuptools && rm -r /root/.cache
cd && git clone https://github.com/xmendez/wfuzz && cd wfuzz
pip3 install -r requirements.txt --ignore-installed
pip3 install shodan
python3 setup.py install
apk del git
