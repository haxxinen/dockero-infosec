#!/usr/bin/env sh

set -e
apk --update --no-cache add nmap nmap-scripts nmap-nselibs git curl python3 py3-pip py3-setuptools
pip install python-nmap
