#!/usr/bin/env bash

set -e

apt-get update -qq && apt-get install -yqq --no-install-recommends --no-install-suggests \
git wget build-essential ca-certificates apt-utils python3 python3-dev python3-pip x11-utils \
python3-setuptools libffi-dev

git clone https://github.com/ChrisTruncer/EyeWitness /tmp/EyeWitness
cd /tmp/EyeWitness/Python/setup
bash setup.sh
