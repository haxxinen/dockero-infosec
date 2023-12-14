FROM debian:latest
COPY setup.sh /tmp/setup.sh
RUN bash /tmp/setup.sh && rm -r /tmp/setup.sh
ENTRYPOINT ["/usr/bin/scrying"]
