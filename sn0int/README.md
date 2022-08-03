#### 1. About
- URL: https://github.com/kpcyrd/sn0int
- Semi-automatic OSINT framework and package manager
- Docs:
  - https://sn0int.com/
  - https://sn0int.readthedocs.io
- Todo: compare with `recon-ng`

#### 2. Build
```
# cd /tmp
# docker run --rm --init -it -v "$PWD/.cache:/cache" -v "$PWD/.data:/data" kpcyrd/sn0int
```

#### 3. Run

##### Example 1
```
> pkg quickstart
> pkg list
> workspace domains
> add domain
> use ctlogs
> run
```

##### Example 2
```
> use dns-resolve
> run
> use url-scan
> run
> target
> target where resolvable
> run
> select urls
```

##### Example 3
```
> select domains
> select domains where id=1
> select domains where value like %.com
> select domains where ( value like e% and value like %m ) or false
```
