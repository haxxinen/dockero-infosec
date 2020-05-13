#### 1. About
- URL: https://github.com/FSecureLABS/drozer
- Android cross-application exploitation framework

#### 2. Build / Run
```
# docker build -t drozer .
# docker run --rm -it drozer
```

#### 3. Usage
```
root@691adbcfdbd3:/# adb connect 192.168.56.105
root@691adbcfdbd3:/# adb forward tcp:31415 tcp:31415
root@691adbcfdbd3:/# drozer console devices
List of Bound Devices

Device ID         Manufacturer         Model                 Software
70f660547bdb2537  unknown              Samsung               9
root@691adbcfdbd3:/# drozer console connect
```
