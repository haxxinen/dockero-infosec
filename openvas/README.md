#### 1. Download and run
```
# docker pull mikesplain/openvas
# docker run -d -p 443:443 --name openvas mikesplain/openvas
```


#### 2. Update NVTs
```
# docker exec -it openvas bash
root@docker# greenbone-nvt-sync
root@docker# openvasmd --rebuild --progress
```


#### 3. Run with OpenVAS manager
```
# docker run -d -p 443:443 -p 9390:9390 --name openvas mikesplain/openvas
```


#### 4. Reset admin password
```
# docker run -d -p 443:443 -e OV_PASSWORD=whatever --name openvas mikesplain/openvas
```


#### 5. Run with volume support
```
# mkdir openvas_workspace && cd openvas_workspace
# docker run -d -p 443:443 -v `pwd`:/var/lib/openvas/mgr/ --name openvas mikesplain/openvas
```
