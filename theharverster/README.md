#### 1. About

- URL: `https://github.com/laramies/theHarvester`
- E-mails, subdomains and names Harvester


#### 2. Build
```
# git clone https://github.com/laramies/theHarvester && cd theHarvester
# docker build -t theharvester .
```

#### 3. Example
```
# docker run --rm -it -v $HOME/.config/theharvester/api-keys.yaml:/app/api-keys.yaml \
--entrypoint=/bin/bash theharvester
root@dd093bb86031:/app# python3 ./theHarvester.py -d https://example.com -b binaryedge
```
