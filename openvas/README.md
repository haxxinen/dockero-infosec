#### 1. Download and run
```
# docker pull mikesplain/openvas
# mkdir /opt/openvas_workspace
# docker run -d -p 443:443 -p 9390:9390 -e OV_PASSWORD=admin \
-v /opt/openvas_workspace:/var/lib/openvas/mgr/ --name openvas mikesplain/openvas
```


#### 2. Update NVTs
```
# docker exec -it openvas bash
root@docker# greenbone-nvt-sync
root@docker# openvasmd --rebuild --progress
root@docker# greenbone-certdata-sync
root@docker# greenbone-scapdata-sync
root@docker# openvasmd --update --verbose --progress
root@docker# /etc/init.d/openvas-manager restart
root@docker# /etc/init.d/openvas-scanner restart
```
