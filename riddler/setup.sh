#!/usr/bin/env sh

set -e

apk --update --no-cache add python3 python3-dev
pip3 install --upgrade pip setuptools && rm -r /root/.cache

pip3 install requests
cd / && wget https://riddler.io/static/tools/riddler-cli.py
