#### 1. About

- URL: `https://github.com/OWASP/Amass`
- DNS Enumeration tool

#### 2. Build
```
# docker build -t amass https://github.com/OWASP/Amass.git
# mkdir -p $HOME/.config/amass/
```

#### 3. Run
```
# wget -q https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt
# docker run --rm -it \
-v $HOME/.config/amass/:/.config/amass/ \
-v `pwd`/words_alpha.txt:/x \
amass enum -ip -brute -min-for-recursive 3 -w /x -d example.com
```

#### 4. Custom config for API creds
```
# wget https://raw.githubusercontent.com/OWASP/Amass/master/examples/config.ini # modify this
# mv config.ini $HOME/.config/amass/config.ini
```

#### 5. Results

```
# awk '{print $1}' ~/.config/amass/amass.txt | sort -u >> /tmp/amass_domains.txt
# awk '{print $2}' ~/.config/amass/amass.txt | tr ',' '\n' | sort -u >> /tmp/amass_IPs.txt
```
