#!/usr/bin/env sh

set -e
apk --update --no-cache add nmap nmap-scripts nmap-nselibs git curl python3 py3-pip py3-setuptools
rm /usr/lib/python3*/EXTERNALLY-MANAGED # fix 'This environment is externally managed' error
pip install python-nmap
