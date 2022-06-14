#### 1. About
- URL: `https://github.com/xmendez/wfuzz`
- web application fuzzer (similar to Burps's intruder)

#### 2. Build
```
# docker build -t wfuzz .
```

#### 3. Examples 

##### a. Fuzz GET request parameter value
```
# list='/opt/SecLists/Fuzzing/LFI/LFI-Jhaddix.txt'
# docker run --rm -it -v $list:/x wfuzz -w /x --hc 404,403 --hh 0 -c -Z https://127.0.0.1/test.php?page=FUZZ
```

##### b. Fuzz POST request parameter name
```
# list=/opt/SecLists/Discovery/Web-Content/raft-medium-words.txt
# docker run --rm -it -v $list:/x wfuzz -w /x --hh 16 -d "FUZZ=1" -t 5 https://127.0.0.1
```

##### c. DNS Enum
```
# cd /tmp/
# wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/subdomains-top1million-5000.txt
# list=`pwd`'/subdomains-top1million-5000.txt'
# docker run --rm -it -v $list:/x wfuzz -w /x -c -Z -L --sc 200,202,204,301,302,307,403 https://FUZZ.example.com
# docker run --rm -it -v $list:/x wfuzz -w /x -c -Z -L --hh 0 https://FUZZ.example.com
```

##### d. Virtual host enumeration
```
# cd /tmp/
# wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/subdomains-top1million-5000.txt
# list=`pwd`'/subdomains-top1million-5000.txt'
# docker run --rm -it -v $list:/x wfuzz -w /x -c -Z -u 'https://example.com' -H "Host: FUZZ.example.com" --hh 345
```
