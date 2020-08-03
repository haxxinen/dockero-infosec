#!/usr/bin/env bash

[ -e ../countries ] && rm -r ../countries
mkdir ../countries
cp fsvpn.conf fsvpn.conf.back

endpoints=`grep 'dns' clp-beta-prov.servers.json | grep -oE freedome.*.net`
for dns in $endpoints; do
	config=`echo -n $dns | sed 's/.freedome-vpn.net//g'`
	sed -i "s/^remote.*.net/remote $dns/" fsvpn.conf
	cp fsvpn.conf ../countries/$config.conf
done

cp fsvpn.conf.back fsvpn.conf
rm fsvpn.conf.back
