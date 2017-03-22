# Centos 7 Build machine

FROM centos


RUN yum update -y
RUN yum install -y deltarpm which
RUN yum groupinstall -y 'Development Tools'
RUN yum install -y ruby-devel
RUN gem install fpm

RUN mkdir /build


ENTRYPOINT /bin/bash
