#!/usr/bin/env bash
docker run -v $(PWD):/var/lib/couchdb -p 5984:5984 sellorm/couchdb
