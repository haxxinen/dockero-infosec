#!/usr/bin/env bash

set -e

python3 /riddler-cli.py \
--username "$riddler_email" \
--password "$riddler_pass" \
--query "pld:$domain" \
--limit 3000 --output host \
--format csv | sort -u | grep $domain
