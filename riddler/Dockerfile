FROM alpine:latest

ARG email
ARG pass

ENV riddler_email=$email
ENV riddler_pass=$pass

COPY entrypoint.sh /entrypoint.sh
COPY setup.sh /tmp/setup.sh
RUN sh /tmp/setup.sh && rm -r /tmp/setup.sh

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
