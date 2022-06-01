#### 1. About

- URL: `https://github.com/projectdiscovery/subfinder`
- passive subdomain discovery tool
- uses third party sources (PassiveTotal, Shodan, DNSDumpster)
- like old aquatone, it can be configured to work with API keys for various services
- similar to sublist3r (successor)

#### 2. Build
```
# docker build -t subfinder https://github.com/projectdiscovery/subfinder.git
```

#### 3. Usage

```
# mkdir -p $HOME/.config/subfinder
# nano $HOME/.config/subfinder/provider-config.yaml # modify this
# docker run --rm -it -v $HOME/.config/subfinder:/root/.config/subfinder \
subfinder -d example.com -silent > subfinder_results.txt
```

#### 4. Config example
```
binaryedge:
  - <API_KEY>
censys:
  - <API_KEY>
certspotter: [<API_KEY>]
passivetotal:
  - <API_KEY>
securitytrails: [<API_KEY>]
shodan:
  - <API_KEY>
virustotal:
  - <API_KEY>
```
