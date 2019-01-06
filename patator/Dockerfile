FROM debian:latest

COPY setup.sh /tmp/setup.sh
RUN bash /tmp/setup.sh && rm -r /tmp/setup.sh
ENTRYPOINT ["python", "/usr/local/bin/patator.py"]
