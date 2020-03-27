FROM alpine:latest

COPY entrypoint.sh /entrypoint.sh
COPY setup.sh /tmp/setup.sh
RUN sh /tmp/setup.sh && rm -r /tmp/setup.sh

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]


