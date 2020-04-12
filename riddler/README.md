#### 1. About

- URL: `https://riddler.io`
- DNS database (via web crawling)

#### 2. Build
```
# docker build --build-arg email='<your_email>' --build-arg pass='<your_password>' -t riddler .
```

#### 3. Run
```
# docker run --rm -it --env domain=example.com riddler > /tmp/riddler.txt
```
