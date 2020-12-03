#!/usr/bin/env bash

docker run -d --rm --privileged \
--sysctl net.ipv6.conf.all.disable_ipv6=0 \
-p 127.0.0.1:$PORT:8118 \
-v `pwd`/configs/supervisord.conf:/etc/supervisord.conf \
--env CONFIG=$CONFIG.conf \
--name $CONFIG \
freedome
