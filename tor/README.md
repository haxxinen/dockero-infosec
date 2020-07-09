#### 1. About

- URL: `https://www.torproject.org/`
- Runs TOR instance (SOCKS server) in Alpine container


#### 2. Build
```
# docker-compose -f tor.yml build
```


#### 3. Run

```
# docker-compose -f tor.yml up -d
# http --proxy=http:socks5://127.0.0.1:9050 icanhazip.com -b
```
