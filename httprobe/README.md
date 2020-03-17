
#### 1. About
- URL: `https://github.com/tomnomnom/httprobe`
- probe for working HTTP and HTTPS servers from DNS/IP list

#### 2. Build
```
# docker build -t httprobe https://github.com/tomnomnom/httprobe.git
```

#### 3. Run
```
# cat hosts.txt | docker run -i httprobe -s -p xlarge -c 10
# cat hosts.txt | docker run -i httprobe -s -p http:$ports -p https:$ports -c 10
```
