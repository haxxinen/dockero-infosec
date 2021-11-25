FROM golang:latest

RUN mkdir /root/revgo
COPY run.go /root/revgo
RUN cd /root/revgo && go mod init revgo
RUN go install mvdan.cc/garble@latest
COPY entrypoint.sh /root/revgo/entrypoint.sh
WORKDIR /root/revgo
ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
