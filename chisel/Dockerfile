FROM golang:latest
COPY entrypoint.sh /root/entrypoint.sh
RUN git clone https://github.com/jpillora/chisel /root/chisel
RUN go install mvdan.cc/garble@latest
WORKDIR /root/chisel
ENTRYPOINT ["/bin/sh", "/root/entrypoint.sh"]
