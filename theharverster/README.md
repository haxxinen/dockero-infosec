#### 1. About

- URL: `https://github.com/laramies/theHarvester`
- E-mails, subdomains and names Harvester


#### 2. Build
```
# git clone https://github.com/laramies/theHarvester && cd theHarvester
# docker build -t theharvester .
```

#### 3. Usage
```
# mkdir -p $HOME/.config/theharvester
# nano $HOME/.config/theharvester/api-keys.yaml # modify this
# docker run --rm -it -v $HOME/.config/theharvester/api-keys.yaml:/app/api-keys.yaml \
--entrypoint=/bin/sh theharvester
root@dd093bb86031:/app# python3 ./theHarvester.py -d https://example.com -b binaryedge
```

#### 4. Config example
```
apikeys:
  binaryedge:
    key: <data>

  censys:
    id: <data>
    secret: <data>

  github:
    key: <data>

  rocketreach:
    key:

  securityTrails:
    key: <data>

  shodan:
    key: <data>
```
