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

#### 5. Random gateway access (file: `/tmp/random_gw.sh`)

```bash
#!/bin/bash

# declare array with 
countries=("at-gw" "au-gw" "be-gw" "ca-gw" "ca-montreal" "ca-vancouver" "ch-gw" "cz-gw" "de-gw" 
	"dk-gw" "es-gw" "fi-gw" "fr-gw" "gb-gw" "ie-gw" "it-gw2" "jp-gw" "mx-gw" "nl-gw" "no-gw" 
	"pl-gw" "se-gw" "sg-gw" "us-gw" "us-nw" "us-se" "us-south" "us-west"
)

max=${#countries[@]}
p=`shuf -i 0-"$(($max-1))" -n 1`
gw="freedome-${countries[$p]}"
port=`shuf -i 1025-65535 -n 1`

# run freedome container called $gw
export CONFIG=$gw; export PORT=$port; bash start_freedome.sh 2>/dev/null >/dev/null
# set proxy
export https_proxy="http://127.0.0.1:$port"
export http_proxy="http://127.0.0.1:$port"

sleep 5

# curl target (in this example it returns the IP address of the gateway)
ip=`curl -sSL https://icanhazip.com 2>/dev/null`
curl -sSL "http://geoip.nemesida-security.com/geoip?ip=$ip" 2>/dev/null
echo 

# kill container
docker rm -f $gw 2>/dev/null >/dev/null
```

Running the script:
```
# cd dockero-infosec/freedome

# bash /tmp/random_gw.sh
{"city": "Parsippany", "country": "US", "hosting": true, "isp": "Leaseweb USA, Inc.", "lat": 40.8617, "lon": -74.4104, "mobile": false, "org": "LeaseWeb USA, Inc. New York", "proxy": false, "status": "success", "timezone": "America/New_York", "ipaddress": "173.234.158.87", "crawler": false, "reputation": "0"}

# bash /tmp/random_gw.sh
{"city": "Paris", "country": "FR", "hosting": true, "isp": "ANEXIA Internetdienstleistungs GmbH", "lat": 48.8323, "lon": 2.4075, "mobile": false, "org": "ANX", "proxy": false, "status": "success", "timezone": "Europe/Paris", "ipaddress": "37.252.225.107", "crawler": false, "reputation": "0"}

# parallel --null -j 4 < /bin/bash /tmp/random_gw.sh
```
