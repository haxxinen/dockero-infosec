#### 1. About

- URL: `https://github.com/FortyNorthSecurity/EyeWitness`
- take screenshots of websites, RDP services, and open VNC servers


#### 2. Build
```
# git clone https://github.com/FortyNorthSecurity/EyeWitness && cd EyeWitness
# docker build --build-arg user=$USER --tag eyewitness --file ./Python/Dockerfile .
```


#### 3. Examples

0. Work directory required
```
# mkdir eyewitness_workdir && cd eyewitness_workdir
```

1. Single URL
```
# docker run --rm -it -v `pwd`:/tmp/EyeWitness eyewitness --web --single https://example.com --prepend-https
```

2. List of URLs
```
# head /tmp/urls.txt
https://example.com
http://example.com
https://example.com:8080
# docker run --rm -it -v `pwd`:/tmp/EyeWitness -v URLS.txt:/x \
eyewitness --web -f /x --threads 30 --max-retries 2 --timeout 3 --jitter 3
```

3. Socks proxy
```
# docker run --rm -it -v `pwd`:/tmp/EyeWitness -v /tmp/urls.txt:/x \
eyewitness --web -f /x --threads 3 --max-retries=1 --timeout 20 \
--proxy-ip 192.168.9.11 --proxy-port 9050 --proxy-type socks5
```
TOR config (`/etc/tor/torrc`):
```
SOCKSPort 192.168.9.11:9050
```

4. RDP/VNC
```
# docker run --rm -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
-v `pwd`:/tmp/EyeWitness -v /tmp/targets.txt:/x \
eyewitness --rdp -f /x --no-dns --threads 3 --max-retries=1 --timeout 5

# docker run --rm -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
-v `pwd`:/tmp/EyeWitness -v /tmp/targets.txt:/x \
eyewitness --vnc -f /x --no-dns --threads 3 --max-retries=1 --timeout 5
```

5. Run on Windows
```
PS C:\Windows\Temp> mkdir eyewitness_workdir; cd eyewitness_workdir
PS C:\Windows\Temp\eyewitness_workdir> docker run --rm -it -v {PWD}:/tmp/EyeWitness -v {PWD}/URLs.txt:/x eyewitness --web -f /x --threads 30 --max-retries 2 --timeout 3 --jitter 3
```
