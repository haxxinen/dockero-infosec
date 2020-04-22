#### 1. About

- URL: `https://github.com/OJ/gobuster`
- directory/file & DNS busting tool written in Go


#### 2. Build
```
# docker build -t gobuster .
```


#### 3. Examples

Dir mode:
```
# list='/tmp/dirs.txt'
# docker run --rm -it -v $list:/x \
gobuster dir -u 'https://10.11.1.10' -w /x -t 30 -a 'Mozilla/5.0' -s "200,204,301,302,307,401,403" -k
```

DNS mode:
```
# wget -q https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt
# list=`pwd`/words_alpha.txt
# docker run --rm -it -v $list:/x \
gobuster dns -d example.com -t 50 -w /x --wildcard -q
```

Using multiple files via `gobuster_enum.sh`:
```
# bash gobuster_enum.sh
# sort -u /tmp/gobuster.txt
```
