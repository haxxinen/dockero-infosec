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
# wget https://raw.githubusercontent.com/projectdiscovery/subfinder/master/config.yaml # modify this
# mv config.yaml $HOME/.config/subfinder
# docker run --rm -it -v $HOME/.config/subfinder:/root/.config/subfinder \
subfinder -d example.com -silent > subfinder_results.txt
```
