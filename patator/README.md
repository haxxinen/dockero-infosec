#### 1. About

- URL: `https://github.com/lanjelot/patator`
- multi-purpose brute-force tool


#### 2. Build
```
# docker build -t patator .
```


#### 3. Test

The following will check if all `patator` modules are installed.
```
# m=`docker run --rm patator 2>&1 | grep '+.*:.*' | tr -d '+' | awk -F ':' '{print $1}' | tr -d ' '`
# for i in $m; do docker run --rm patator $i 2>&1 | grep 'ERROR:.*required to run' && echo " - MODULE: $i"; done
```


#### 4. Run

Check examples folder.
