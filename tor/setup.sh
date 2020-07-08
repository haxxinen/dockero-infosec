#!/usr/bin/env sh

apk --update --no-cache add tor supervisor
sed "1s/^/SOCKSPort 0.0.0.0:9050\n/" /etc/tor/torrc.sample > /etc/tor/torrc.config

chown -R tor /etc/tor
