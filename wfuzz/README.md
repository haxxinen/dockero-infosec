#### 1. About

- URL: `https://github.com/xmendez/wfuzz`
- web application fuzzer (similar to Burps's intruder)


#### 2. Build
```
# docker build -t wfuzz .
```


#### 3. Example
```
# list='/opt/SecLists/Fuzzing/LFI/LFI-Jhaddix.txt'
# docker run --rm -it -v $list:/x wfuzz -w /x --hh 0 https://127.0.0.1/test.php?page=FUZZ
```
