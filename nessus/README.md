#### 1. Build
```
# docker build -t nessus .
```

#### 2. Run / Kill
```
# docker run -v /tmp:/tmp -it --name nessus -p 8834:8834 -d nessus
# docker rm -f nessus
```

#### 3. Get free license
```
https://www.tenable.com/products/nessus/nessus-essentials
https://10minutemail.com/
```

#### 4. Activate and update
```
# docker exec -it nessus /opt/nessus/sbin/nessuscli fetch --register <LICENSE_UUID_FROM_EMAIL>
# docker exec -it nessus /opt/nessus/sbin/nessuscli update --plugins-only
```

#### 5. Test connection
```
# http https://localhost:8834 --verify=no
```
