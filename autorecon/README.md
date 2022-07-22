#### 1. About

- URL: `https://github.com/Tib3rius/AutoRecon`
- automated recon tool (many in one tool)

#### 2. Build
```
# docker pull suezawa/autorecon
```

#### 3. Examples
```
# docker run --network host -it --rm --entrypoint=nmap suezawa/autorecon --top-ports 30 -Pn -open <target>
# docker run --network host -it -v $HOME/autorecon/:/results suezawa/autorecon -v <target>
```
