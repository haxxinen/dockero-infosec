#### 1. About

- URL: `https://github.com/nmap/nmap`
- the network scanner (network mapper)


#### 2. Build & run

Vanilla run:
```
# docker build -t nmap .
# docker run --rm -it nmap
```

Run for HTB VPN interface:
```
# ip=`ip a | grep tun0 | grep inet | awk '{print $2}' | sed 's/\/.*//g'`
# docker run -e ip=$ip -v /tmp:/tmp --rm -it nmap
```

Run scan in background (with hosts from list):
```
# docker run --rm --name nmap -v /tmp:/tmp -d nmap tail -f /dev/null
# docker exec -it nmap sh
# nmap -iL /tmp/ip.txt -p8080 -Pn -n --open -oX /tmp/results.xml 2>/dev/null &
```

#### 3. Examples
```
# nmap 192.168.10.2 -Pn -n -p8180 -sV --script=http-default-accounts
# nmap 192.168.10.2 -Pn -n -p22 -sV -sT --script vulners
# nmap 192.168.10.2 -Pn -n -p25 -sV --script='banner,banner-plus' --open
# nmap 192.168.10.2 -Pn -n -p22 -sV -sT --script='vulscan/vulscan' --script-args 'vulscandb=exploitdb.csv'
# nmap 192.168.10.2 -Pn -n -p1099 -sV -sT --script='*-vuln-*'
```


#### 4. Updates NSE scripts and core dependencies
```
# sh /nmap_scripts_update.sh
```


#### 5. Find NSE scripts for vuln-scanning
```
# sh /find_vuln_nse.sh smb
```
This will offer support for:
1. bruteforce of default web credentials
2. vulners database (`https://vulners.com`)
3. banner-plus script
4. vulscan
