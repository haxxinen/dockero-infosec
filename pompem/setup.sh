#!/usr/bin/env sh

set -e

apk --update --no-cache add python3 py3-pip git
pip3 install --upgrade pip setuptools && rm -r /root/.cache
cd && git clone https://github.com/rfunix/Pompem
cd 'Pompem' && pip install -r requirements.txt
apk del git
