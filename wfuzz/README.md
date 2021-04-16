#### 1. About

- URL: `https://github.com/xmendez/wfuzz`
- web application fuzzer (similar to Burps's intruder)


#### 2. Build
```
# docker build -t wfuzz .
```


#### 3. Example

Fuzz GET request parameter value:
```
# list='/opt/SecLists/Fuzzing/LFI/LFI-Jhaddix.txt'
# docker run --rm -it -v $list:/x wfuzz -w /x --hc 404,403 --hh 0 -c -Z https://127.0.0.1/test.php?page=FUZZ
```

Fuzz POST request parameter name:
```
# list=/opt/SecLists/Discovery/Web-Content/raft-medium-words.txt
# docker run --rm -it -v $list:/x wfuzz -w /x --hh 16 -d "FUZZ=1" -t 5 https://127.0.0.1
```
