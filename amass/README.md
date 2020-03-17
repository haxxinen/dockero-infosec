#### 1. About

- URL: `https://github.com/OWASP/Amass`
- DNS Enumeration tool


#### 2. Build
```
# docker build -t amass https://github.com/OWASP/Amass.git
# mkdir $HOME/.config/amass/
```


#### 3. Run
```
# wget -q https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt
# docker run --rm -it \
-v $HOME/.config/amass/:/.config/amass/ \
-v `pwd`/words_alpha.txt:/tmp/words_alpha.txt \
amass enum -v -src -ip -brute -norecursive -w /tmp/words_alpha.txt -d example.com
```


#### 4. Custom config for API creds
```
# wget https://raw.githubusercontent.com/OWASP/Amass/master/examples/config.ini # modify this
# mv config.ini $HOME/.config/amass/config.ini
```

#### 5. Data operations

Get DNS records only:
```
$ awk '{print $2}' ~/.config/amass/amass.txt | grep example.com >> domains.txt
$ awk '{print $3}' ~/.config/amass/amass.txt | grep example.com >> domains.txt
```

Get IPs only:
```
$ awk '{print $3}' ~/.config/amass/amass.txt | tr ',' '\n' | sort -u | grep -v 'example.com' >> IPs.txt
$ awk '{print $4}' ~/.config/amass/amass.txt | tr ',' '\n' | sort -u | grep -v 'example.com' >> IPs.txt
```

