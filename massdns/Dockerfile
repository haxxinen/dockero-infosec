FROM alpine:latest

ENV results=/tmp/masscan.txt

COPY entrypoint.sh /entrypoint.sh
COPY setup.sh /tmp/setup.sh
RUN sh /tmp/setup.sh && rm -r /tmp/setup.sh

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
