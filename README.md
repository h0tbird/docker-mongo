# docker-mongo

[![Build Status](https://travis-ci.org/h0tbird/docker-mongo.svg?branch=master)](https://travis-ci.org/h0tbird/docker-mongo)

Containerized MongoDB service.

```
docker run -it --rm \
--net host --name mongo \
--env RS_PEERS=foo:27017,bar:27017 \
--env ETCD_IP=127.0.0.1 \
--env ETCD_PORT=2379 \
--env ETCD_PATH=/mongo \
h0tbird/mongo \
--bind_ip 127.0.0.1 \
--port 27017 \
--dbpath /var/lib/mongodb \
--replSet rs0
```
