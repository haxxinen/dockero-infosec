#!/usr/bin/env sh

set -e

win='chisel_windows64'
lin='chisel_linux64'
mac='chisel_macos64'

env GOOS=windows GOARCH=amd64 go build -o /tmp/$win.exe
env GOOS=linux GOARCH=amd64 go build -o /tmp/$lin
env GOOS=darwin GOARCH=amd64 go build -o /tmp/$mac

env GOOS=windows GOARCH=amd64 garble -tiny -literals -seed=random build -o /tmp/$win"_obf.exe" -ldflags="-w -s"
env GOOS=linux GOARCH=amd64 garble -tiny -literals -seed=random build -o /tmp/$lin"_obf" -ldflags="-w -s"
env GOOS=darwin GOARCH=amd64 garble -tiny -literals -seed=random build -o /tmp/$mac"_obf" -ldflags="-w -s"
# alternative obfuscation: unixpickle/gobfuscate

rm -r /tmp/garble-shared* 2>/dev/null
echo "Successfully built executables in /tmp folder!"
