#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM alpine:edge
MAINTAINER Marc Villacorta Morera <marc.villacorta@gmail.com>

#------------------------------------------------------------------------------
# Environment variables:
#------------------------------------------------------------------------------

ENV ETCD_VERSION="v2.2.5" \
    ETCD_URL="https://github.com/coreos/etcd/releases/download"

#------------------------------------------------------------------------------
# Install:
#------------------------------------------------------------------------------

RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    && apk --no-cache add --update -t deps wget ca-certificates \
    && apk --no-cache add --update bash mongodb \
    && wget ${ETCD_URL}/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz \
    && tar zxvf etcd-${ETCD_VERSION}-linux-amd64.tar.gz \
    && mv etcd-${ETCD_VERSION}-linux-amd64/etcdctl /usr/bin/ \
    && apk del --purge deps; rm -rf /var/cache/apk/* etcd-${ETCD_VERSION}-*

#------------------------------------------------------------------------------
# Populate root file system:
#------------------------------------------------------------------------------

ADD rootfs /
VOLUME /var/lib/mongodb

#------------------------------------------------------------------------------
# Expose ports and entrypoint:
#------------------------------------------------------------------------------

EXPOSE 27017 28017
ENTRYPOINT ["/init"]
