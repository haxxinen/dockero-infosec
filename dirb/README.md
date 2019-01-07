#### 1. About

- URL: `http://dirb.sourceforge.net/`
- web content scanner


#### 2. Build
```
# docker build -t dirb .
```


#### 3. Example
```
# list='/tmp/list.txt'
# docker run --rm -it -v $list:/x dirb https://example.com /x -r -z 999
```
