#### 1. About

- URL: `https://github.com/RustScan/RustScan`
- The Modern Port Scanner (rust nmap)


#### 2. Build
```
# docker pull cmnatic/rustscan:debian-buster
```


#### 3. Example
```
# docker run -it --rm cmnatic/rustscan:debian-buster rustscan -t 1500 example.com -- -A -sC
```
