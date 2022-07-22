
#### 1. About

- URL: `https://github.com/vanhauser-thc/thc-hydra`
- Parallelized network login cracker.


#### 2. Build
```
# docker pull vanhauser/hydra
```

#### 3. Example
```
# docker run -v /tmp:/tmp --rm -it vanhauser/hydra \
-l root -P /tmp/passwords.txt <target> ssh
```

#### 4. Opsec considerations

This tool will generate useful logs for threathunting.

```
$ sudo tail -f /var/log/auth.log | grep -oE 'Failed password for .*'
Failed password for root from <source_ip> port 52994 ssh2
Failed password for root from <source_ip> port 52998 ssh2
Failed password for root from <source_ip> port 52996 ssh2
```
