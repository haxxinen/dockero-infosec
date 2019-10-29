FROM debian:latest

COPY setup.sh /tmp/setup.sh
RUN bash /tmp/setup.sh && rm -r /tmp/setup.sh
ENTRYPOINT ["python3", "/tmp/EyeWitness/EyeWitness.py", "-d", "/tmp/workdir/results", "--no-prompt"]
