#### 1. About

- URL: `https://github.com/sullo/nikto`
- Nikto web server scanner


#### 2. Build
```
# docker build -t nikto https://github.com/sullo/nikto.git
```


#### 3. Run
```
# docker run --rm -it nikto -timeout 3 -h http://192.168.9.11:8080
# cat urls.txt | docker run --rm -it nikto -timeout 3 -h -
```
