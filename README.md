# docker-mongo

[![Build Status](https://travis-ci.org/h0tbird/docker-mongo.svg?branch=master)](https://travis-ci.org/h0tbird/docker-mongo)

Containerized MongoDB service.

```
docker run -it --rm \
--net host --name mongo \
--env RS_PEERS=foo:27017,bar:27017 \
--env ETCD_BOOT=true \
--env ETCD_ENDPOINT=http://127.0.0.1:2379 \
--env ETCD_PATH=/mongo \
h0tbird/mongo \
--bind_ip 127.0.0.1 \
--port 27017 \
--dbpath /var/lib/mongodb \
--replSet rs0
```

Get and set the bootstrap token:
```
etcdctl get /mongo/token
etcdctl set /mongo/token 0
```
