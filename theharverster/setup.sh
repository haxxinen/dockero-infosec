#!/usr/bin/env sh

set -e
apk --update --no-cache add python3 python3-dev \
git gcc make musl-dev libffi-dev libxml2-dev libxslt-dev

pip3 install --upgrade pip

cd && git clone https://github.com/laramies/theHarvester
cd /root/theHarvester
python3 -m pip install -r requirements.txt
cd && mv /root/theHarvester /etc/theHarvester
