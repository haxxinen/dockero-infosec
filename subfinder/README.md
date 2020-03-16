#### 1. About

- URL: `https://github.com/projectdiscovery/subfinder`
- passive subdomain discovery tool

#### 2. Build
```
# docker build -t subfinder https://github.com/projectdiscovery/subfinder.git
```

#### 3. Usage

- uses third party sources (PassiveTotal, Shodan, DNSDumpster)
- like old aquatone, it can be configured to work with API keys for various services
- similar to sublist3r (successor)

```
# mkdir -p $HOME/.config/subfinder
# cat << EOF > $HOME/.config/subfinder/config.json
resolvers:
  - 1.1.1.1
  - 1.0.0.1
sources:
  - binaryedge
  - bufferover
  - censys
  - passivetotal
  - sitedossier
binaryedge:
  - <API_KEY>
  - <API_KEY>
censys:
  - <API_KEY>
certspotter: []
passivetotal:
  - <email>:<pwd>
securitytrails: []
shodan: []
EOF
# docker run --rm -it -v $HOME/.config/subfinder:/root/.config/subfinder \
subfinder -d example.com -silent > subfinder_results.txt
```
