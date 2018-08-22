# Utilishell container

FROM alpine:latest

# Install updates and repo hosted tools and cleanup
RUN apk update && apk add R R-dev build-base alpine-sdk
COPY ./extras/Rprofile.site /usr/lib/R/etc/Rprofile.site

ENTRYPOINT ["/bin/sh"]
