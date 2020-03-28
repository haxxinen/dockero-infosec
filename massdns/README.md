#### 1. About

- URL: `https://github.com/blechschmidt/massdns`
- high-performance mass DNS resolver


#### 2. Build
```
# docker build -t massdns .
```

#### 3. Run
```
# cat > /tmp/domains.txt << EOF
mail.google.com
docs.google.com
ipv6.google.com
void.google.com
> EOF
# touch /tmp/results.txt
# docker run --rm -it -v /tmp/results.txt:/r -v /tmp/domains.txt:/d massdns
# cat /tmp/results.txt
```
