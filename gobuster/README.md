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
# docker run --rm -it -v $list:/x gobuster -u 'http://example.com' \
-w /x -t 20 -a 'Mozilla/5.0' -s "200,204,301,302,307,401"
```
