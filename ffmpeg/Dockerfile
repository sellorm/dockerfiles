# ffmpeg
#
# Version 0.1
#
# The build-time image should be tagged with the version of ffmpeg


FROM ubuntu:20.04

LABEL Description="Containerised version of ffmpeg"
LABEL Maintainer="github.com/sellorm/dockerfiles"

RUN apt-get update && apt-get install -y ffmpeg

RUN useradd -m -d /workspace ffmpeg

USER ffmpeg
WORKDIR /workspace
ENTRYPOINT ["/usr/bin/ffmpeg"]
