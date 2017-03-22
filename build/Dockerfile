# Centos 7 Build machine

FROM centos


RUN yum update -y
RUN yum install -y deltarpm which ruby-devel && \
  yum groupinstall -y 'Development Tools'
RUN gem install fpm

RUN mkdir /build

ENTRYPOINT ["/bin/bash"]
