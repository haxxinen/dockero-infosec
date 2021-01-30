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
# docker run -it -p 7443:7443 -p 80:80 -p 443:443 --name covenant -d -v `pwd`/Data:/app/Data covenant
```
Admin interface: `https://<EXTERNAL_IP>:7443/covenantuser/login`

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

#### 5. Lisneter

- ConnectAddresses: <EXTERNAL_IP>
- ConnectPort: 443
- BindPort: 443
- BindAddress: 0.0.0.0
- UseSSL: True
- SSCertificate: default.pfx (from previous step)
- SSLCertificatePassword: <EXPORT_PASSWORD> (from previous step)

Note: watch for "Started Listener" notification

#### 5. Instrumentation

1. Launcher config

```
Launchers > Binary > Generate (ValidateCert: false, UseCertPinning: false)
Launchers > Binary > Code > Copy - save as GruntHTTP.cs
```

2. Compile .NET

```
PS>C:\Windows\Microsoft.Net\Framework64\v4*\csc.exe -out:grunt64.exe GruntHTTP.cs
PS>C:\Windows\Microsoft.Net\Framework64\v4*\csc.exe -platform:x86 -out:grunt32.exe GruntHTTP.cs
```
Note: ignore compilation warnings
