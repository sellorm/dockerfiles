# Python MkDocs
#
# Version 0.1
#
# The build-time image should be tagged with the version of mkdocs
# Use `mkdocs -V` the view the mkdocs version

FROM python:3.8-slim

LABEL Description="Containerised version of python's MkDocs for consistent site builds"
LABEL Maintainer="github.com/sellorm/dockerfiles"

RUN pip3 install --no-cache-dir mkdocs mkdocs-material

RUN useradd -m -d /workspace mkdocs

USER mkdocs
WORKDIR /workspace
ENTRYPOINT ["/usr/local/bin/mkdocs"]
