# Dockerized tor on Alpine.
FROM alpine:latest

COPY setup.sh /tmp/setup.sh
RUN sh /tmp/setup.sh && rm -r /tmp/setup.sh

CMD ["/usr/bin/supervisord"]