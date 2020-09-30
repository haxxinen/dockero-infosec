FROM debian:latest

COPY setup.sh /tmp/setup.sh
RUN sh /tmp/setup.sh && rm -r /tmp/setup.sh

EXPOSE 8834

ENTRYPOINT ["/opt/nessus/sbin/nessusd"]

VOLUME ["/opt/nessus/etc/nessus/"]

