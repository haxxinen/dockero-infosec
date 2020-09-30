#!/usr/bin/env bash

set -e

apt-get update && apt-get install -y wget

# Nessus-8.11.1-debian6_amd64.deb
wget "www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/11423/download?i_agree_to_tenable_license_agreement=true" -O nessus.deb

dpkg -i nessus.deb && rm nessus.deb

