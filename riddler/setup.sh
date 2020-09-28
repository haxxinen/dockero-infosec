#!/usr/bin/env sh

set -e

apk --update --no-cache add python3 python3-dev py3-pip

pip3 install --upgrade pip setuptools && rm -r /root/.cache
pip3 install requests

cd / && wget https://riddler.io/static/tools/riddler-cli.py
