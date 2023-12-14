#### 1. Build
```
$ docker build -t scrying .
```

#### 2. Run
```
$ mkdir scrying_workdir && cd scrying_workdir
$ cp /tmp/targets.txt t.txt
$ docker run --rm -it -v `pwd`:/tmp/scrying_workdir scrying \
--output /tmp/scrying_workdir \
--mode vnc \
-f /tmp/scrying_workdir/t.txt
```
