#### 1. About

- URL: `https://github.com/OWASP/Amass`
- DNS Enumeration tool


#### 2. Build
```
# docker build -t amass https://github.com/OWASP/Amass.git
```


#### 3. Run
```
# docker run --rm amass --passive -d example.com -v
# docker run --rm amass -ip -d example.com -v
```
