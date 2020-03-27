#### 1. About

- URL: `https://github.com/blechschmidt/massdns`
- high-performance mass DNS resolver


#### 2. Build
```
# docker build -t massdns .
```

#### 3. Run
```
# touch /tmp/results.txt
# docker run --rm -it -v /tmp/results.txt:/r -v /tmp/domains.txt:/d massdns
```
