# sellorm's Dockerfiles

A collection of Dockerfiles used for building some of the images I use in my tools, builds and pipelines.

## build

Dockerfile used to build the system that I build packages and so on with. the resulting image is used by several of my other projects.

Available on docker hub as [sellorm/build](https://hub.docker.com/r/sellorm/build/).

This is a generic Centos 7 system with a ful suite of the standard build tools, gcc, make, etc. I use it in some of my build scripts the use the [fpm](https://github.com/jordansissel/fpm) package generator tool. Using fpm means I can create .deb and .rpm packages in the same system.

Usage:

```
docker run -ti -v ${PWD}:/build sellorm/build
```

## linkchecker

Simple container to run [linkchecker](https://github.com/wummel/linkchecker) without having to bother installing it.

Available on docker hub as [sellorm/linkchecker](https://hub.docker.com/r/sellorm/linkchecker/).

Linkchecker is a simple to run utility for checking links in html documents or web sites.

Usage:

```
docker run sellorm/linkchecker http://example.com
```

Or for help:

```
docker run sellorm/linkchecker --help
```

## couchdb

CouchDB in a container!

Available on docker hub as [sellorm/couchdb](https://hub.docker.com/r/sellorm/couchdb/).

CouchDB is a lightweight document oriented database.

Usage:

```
docker run -v $(PWD):/var/lib/couchdb -p 5984:5984 sellorm/couchdb
```

This exposes couchdb on port 5984 on your local machine and writes the couchdb database files to the current working directory.
