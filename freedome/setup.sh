#!/usr/bin/env sh

apk --update --no-cache add openvpn
rm -rf /var/cache/apk/* 2>/dev/null
