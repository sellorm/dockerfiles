# Couchbase

FROM ubuntu

RUN apt update && apt upgrade -y && \
  apt install -y couchdb
RUN mkdir -p /var/run/couchdb/ && touch /var/run/couchdb/couch.uri && \
  sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/couchdb/default.ini

ENTRYPOINT ["/usr/bin/couchdb"]
