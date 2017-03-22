# Linkchecker 9.3-4

FROM debian

RUN apt update && apt upgrade -y && \
  apt install -y curl python python-requests
RUN curl -o /tmp/linkchecker.deb http://ftp.debian.org/debian/pool/main/l/linkchecker/linkchecker_9.3-4_amd64.deb && \
  dpkg -i /tmp/linkchecker.deb

ENTRYPOINT ["/usr/bin/linkchecker"]
