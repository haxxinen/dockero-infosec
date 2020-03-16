#### 1. About

- URL: `https://github.com/OWASP/Amass`
- DNS Enumeration tool


#### 2. Build
```
# docker build -t amass https://github.com/OWASP/Amass.git
```


#### 3. Run
```
# wget -q https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt
# docker run --rm -it -v `pwd`/words_alpha.txt:/tmp/words_alpha.txt \
amass enum -v -src -ip -brute -norecursive -w /tmp/words_alpha.txt -d example.com
```
