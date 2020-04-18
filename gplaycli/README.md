#### 1. About

- URL: `https://github.com/matlink/gplaycli`
- Google Play Downloader via Command line


#### 2. Build
```
# git clone https://github.com/matlink/gplaycli-docker && cd gplaycli-docker
# docker build -t gplaycli .
```


#### 3. Run

Search package:
```
# docker run --rm -it gplaycli -s <app_name>
```

Download:
```
# docker run --rm -it -v /tmp/apks:/tmp gplaycli -p -d <package_name> -f /tmp/
```
