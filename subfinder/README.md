#### 1. About

- URL: `https://github.com/subfinder/subfinder`
- subdomain discovery tool


#### 2. Build
```
# docker build -t subfinder https://github.com/subfinder/subfinder.git
```


#### 3. Active

1. Setup:
```
# mkdir -p $HOME/.config/subfinder
# wget -q https://raw.githubusercontent.com/aboul3la/Sublist3r/master/subbrute/resolvers.txt
# wget -q https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt
# mv resolvers.txt $HOME/.config/subfinder
# mv words_alpha.txt $HOME/.config/subfinder
```

2. Usage:
```
# docker run --rm -it -v $HOME/.config/subfinder:/root/.config/subfinder \
subfinder -b -d example.com --no-passive -w /root/.config/subfinder/words_alpha.txt --timeout 15 -t 10 -nW -r 8.8.8.8,1.1.1.1

# docker run --rm -it -v $HOME/.config/subfinder:/root/.config/subfinder \
subfinder -b -d example.com --no-passive -w /root/.config/subfinder/words_alpha.txt --timeout 15 -t 10 -nW
```


#### 4. Passive

- uses third party sources (PassiveTotal, Shodan, DNSDumpster)
- like old aquatone, it can be configured to work with API keys for various services
- similar to sublist3r (successor)

```
# mkdir -p $HOME/.config/subfinder
# cat << EOF > $HOME/.config/subfinder/config.json
{
	"virustotalApikey": "",
	"passivetotalUsername": "",
	"passivetotalKey": "",
	"securitytrailsKey": "",
	"riddlerEmail": "",
	"riddlerPassword": "",
	"censysUsername": "",
	"censysSecret": "",
	"shodanApiKey": ""
}
EOF
# docker run --rm -it -v $HOME/.config/subfinder:/root/.config/subfinder \
subfinder -d example.com --silent --exclude-sources='dnsdb,yahoo,baidu,waybackarchive' > subfinder_results.txt
```
