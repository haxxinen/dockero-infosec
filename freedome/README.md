#### Build
```
# docker build -t freedome .
```

#### Run
```sh
#!/usr/bin/env bash

CONFIG='freedome-de-gw'
PORT=9991

docker run -d --rm --privileged \
--sysctl net.ipv6.conf.all.disable_ipv6=0 \
-p 127.0.0.1:$PORT:8118 \
-v `pwd`/configs/supervisord.conf:/etc/supervisord.conf \
--env CONFIG=$CONFIG.conf \
--name $CONFIG \
freedome
```
Note: 
- to avoid routing issues it is recommended to listen on `127.0.0.1`
- `privoxy` external-listener must be used as upstream towards `127.0.0.1`


#### Use as upstream proxy to `localhost` (could be the VM)
```
# http http://icanhazip.com --proxy=http:http://127.0.0.1:9991 -b
# http https://icanhazip.com --proxy=https:http://127.0.0.1:9991 -b
```

#### Handling inbound requests (from external into VM)
```
# cat privoxy_DE.config
listen-address  172.16.201.160:9991
forward   /     127.0.0.1:9991
# /usr/sbin/privoxy --user privoxy --no-daemon privoxy_DE.config
# http http://icanhazip.com --proxy=http:http://172.16.201.160:9991 -b
```

#### Dynamically generate configs for each country

- run `make_configs.sh`
