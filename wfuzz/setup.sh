#!/usr/bin/env sh

set -e

apk --update --no-cache add python3 python3-dev curl-dev gcc musl-dev git
pip3 install --upgrade pip setuptools && rm -r /root/.cache
cd && git clone https://github.com/xmendez/wfuzz && cd wfuzz
pip install -r requirements.txt
python3 setup.py install
apk del git
