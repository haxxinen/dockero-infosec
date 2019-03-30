#!/usr/bin/env bash

set -e

python /opt/unicorn/unicorn.py "$@" 
mv powershell_attack.txt /tmp/payload
msfconsole -r unicorn.rc
