#### 1. About
- URL: `https://github.com/zmap/zdns`
- DNS lookup tool written in Go

#### 2. Build
```
# docker pull stklcode/zdns:latest
```

#### 3. Run
```
# wget https://public-dns.info/nameservers.txt -O /tmp/nameservers.txt
# ns=`shuf -n 100 /tmp/nameservers.txt | tr '\n' ',' | sed 's/,$//g'`
# cat /tmp/domains.txt | docker run --rm -i stklcode/zdns A \
--name-servers=$ns -result-verbosity=short -retries=3 -timeout=20 | grep answers > /tmp/zdns_answers.txt
# for i in `cat /tmp/zdns_answers.txt`; do echo $i | jq .name; done | tr -d '"' > /tmp/zdns.txt
```
