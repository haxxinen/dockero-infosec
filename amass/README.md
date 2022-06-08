#### 1. About

- URL: `https://github.com/OWASP/Amass`
- DNS Enumeration tool
- Docs: https://github.com/OWASP/Amass/wiki/Installation-Guide

#### 2. Build
```
# docker build -t amass https://github.com/OWASP/Amass.git
# mkdir -p $HOME/.config/amass/
```

#### 3. Config
```
# wget https://raw.githubusercontent.com/OWASP/Amass/master/examples/config.ini # modify this
# mv config.ini $HOME/.config/amass/config.ini
```

#### 4. Run
```
# docker run --rm -it -v $HOME/.config/amass/:/.config/amass/ amass enum -d example.com
```

#### 5. Bruteforce
```
# cd /tmp && wget https://raw.githubusercontent.com/rbsec/dnscan/master/subdomains-100.txt
# docker run --rm -it \
-v $HOME/.config/amass/:/.config/amass/ \
-v `pwd`/subdomains-100.txt:/x \
amass enum -active -brute -src -ip -norecursive -w /x -d example.com
```

#### 5. Results
```
# awk '{print $1}' ~/.config/amass/amass.txt | sort -u >> /tmp/amass_domains.txt
# awk '{print $2}' ~/.config/amass/amass.txt | tr ',' '\n' | sort -u >> /tmp/amass_IPs.txt
```
