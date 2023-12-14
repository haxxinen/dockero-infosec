#### 1. Build
```
$ docker build -t scrying .
```

#### 2. Run
```
$ mkdir scrying_workdir && cd scrying_workdir
$ docker run --rm -it -v `pwd`:/tmp/scrying_workdir scrying --output-dir /tmp/scrying_workdir
```
