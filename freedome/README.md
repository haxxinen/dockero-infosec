#### 0. Build `privoxy` image (dependency)

```
# git clone https://github.com/haxxinen/dockero-dev && cd dockero-dev/alpine_privoxy
# docker build -t privoxy .
```

#### 1. Build
```
# cd dockero-infosec/freedome
# docker build -t freedome .
```

#### 2. Run
```
# export CONFIG='freedome-de-gw'
# export PORT=9991
# cd dockero-infosec/freedome
# bash start_freedome.sh
```

Note:
- to avoid routing issues it is recommended to listen on `127.0.0.1`
- `privoxy` external-listener must be used as upstream towards `127.0.0.1`


#### 3. Use as upstream proxy to `localhost` (could be the VM)
```
# http http://icanhazip.com --proxy=http:http://127.0.0.1:9991 -b
# http https://icanhazip.com --proxy=https:http://127.0.0.1:9991 -b
```

#### 4. Handling inbound requests (from external into VM)
```
# cat privoxy_DE.config
listen-address  172.16.201.160:9991
forward   /     127.0.0.1:9991
# /usr/sbin/privoxy --user privoxy --no-daemon privoxy_DE.config
# http http://icanhazip.com --proxy=http:http://172.16.201.160:9991 -b
```
