#!/usr/bin/env sh

set -e

ln -s /usr/src/metasploit-framework/msfconsole /usr/bin/msfconsole
ln -s /usr/src/metasploit-framework/msfvenom /usr/bin/msfvenom

apk --update --no-cache add python3 git
cd && git clone https://github.com/trustedsec/unicorn /opt/unicorn
