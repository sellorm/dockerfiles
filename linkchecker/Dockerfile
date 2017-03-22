# Centos 7 Build machine

FROM debian


RUN apt update
RUN apt upgrade -y
RUN apt install -y curl
RUN apt install -y python python-requests
RUN curl -o /tmp/linkchecker.deb http://ftp.debian.org/debian/pool/main/l/linkchecker/linkchecker_9.3-4_amd64.deb
RUN dpkg -i /tmp/linkchecker.deb

ENTRYPOINT ["/usr/bin/linkchecker"]

