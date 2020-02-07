#### 1. About

- URL: `https://github.com/OJ/gobuster`
- directory/file & DNS busting tool written in Go


#### 2. Build
```
# docker build -t gobuster .
```


#### 3. Example
```
# list='/tmp/dirs.txt'
# docker run --rm -it -e ip='10.10.10.10' -v $list:/x gobuster dir -u 'https://10.11.1.10' -w /x -t 30 -a 'Mozilla/5.0' -s "200,204,301,302,307,401,403" -k
```
