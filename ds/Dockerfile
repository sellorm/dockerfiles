FROM debian:testing

## Set a default user. Available via runtime flag `--user docker` 
## Add user to 'staff' group, granting them write privileges to /usr/local/lib/R/site.library
## User should also have & own a home directory (for rstudio or linked volumes to work properly). 
RUN useradd docker \
	&& mkdir /home/docker \
	&& chown docker:docker /home/docker \
	&& addgroup docker staff \
        && echo "docker:rstudio" | chpasswd

RUN apt-get update \ 
	&& apt-get install -y --no-install-recommends \
		ed \
		less \
		locales \
		vim-tiny \
		wget \
		ca-certificates \
		fonts-texgyre \
                file \
                git \
                libapparmor1 \
                libcurl4-openssl-dev \
                libedit2 \
                libssl-dev \
                libssl1.0.2 \
                lsb-release \
                psmisc \
	        procps \
                python-setuptools \
                sudo \
	&& rm -rf /var/lib/apt/lists/*

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

## Use Debian unstable via pinning -- new style via APT::Default-Release
RUN echo "deb http://http.debian.net/debian sid main" > /etc/apt/sources.list.d/debian-unstable.list \
        && echo 'APT::Default-Release "testing";' > /etc/apt/apt.conf.d/default 

ENV R_BASE_VERSION 3.5.1

## Now install R and littler, and create a link for littler in /usr/local/bin
RUN apt-get update \
	&& apt-get install -t unstable -y --no-install-recommends \
		r-base=${R_BASE_VERSION}-* \
		r-base-dev=${R_BASE_VERSION}-* \
		r-recommended=${R_BASE_VERSION}-* \
                libxml2-dev \
                libssl-dev \
                build-essential \
                libcurl4-gnutls-dev \
	&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
	&& rm -rf /var/lib/apt/lists/* 

## Get rstudio and install
RUN wget -q https://download2.rstudio.org/rstudio-server-stretch-1.1.456-amd64.deb \
        && dpkg -i rstudio-server-stretch-1.1.456-amd64.deb

RUN R -e 'install.packages(c("plumber", "shiny", "rmarkdown"), repo = "https://cran.rstudio.com")'
RUN R -e 'install.packages(c("tidyverse"), repo = "https://cran.rstudio.com")'

## configure R for RStudio 
RUN echo 'rsession-which-r=/usr/bin/R' >> /etc/rstudio/rserver.conf

## Set up S6 init system
RUN wget -q -P /tmp/ https://github.com/just-containers/s6-overlay/releases/download/v1.11.0.1/s6-overlay-amd64.tar.gz \
        && tar xzf /tmp/s6-overlay-amd64.tar.gz -C / \
        && mkdir -p /etc/services.d/rstudio \
        && echo '#!/usr/bin/with-contenv bash \
                \n exec /usr/lib/rstudio-server/bin/rserver --server-daemonize 0' \
                > /etc/services.d/rstudio/run \
        && echo '#!/bin/bash \
                \n rstudio-server stop' \
                > /etc/services.d/rstudio/finish

## openbugs - http://www.openbugs.net/w/Downloads - run `OpenBUGS`
RUN apt-get update \
        && apt-get install --no-install-recommends \
                libc6-i386 \
        && rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
        && rm -rf /var/lib/apt/lists/*
RUN wget -q http://pj.freefaculty.org/Ubuntu/15.04/amd64/openbugs/openbugs_3.2.3-1_amd64.deb \
        && dpkg -i openbugs_3.2.3-1_amd64.deb \
        && rm openbugs_3.2.3-1_amd64.deb

## jags - http://mcmc-jags.sourceforge.net/
RUN apt-get update \
        && apt-get install --no-install-recommends \
                libltdl7 \
        && rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
        && rm -rf /var/lib/apt/lists/*
RUN wget -q http://ftp.debian.org/debian/pool/main/j/jags/jags_4.3.0-2_amd64.deb \
        && dpkg -i jags_4.3.0-2_amd64.deb \
        && rm jags_4.3.0-2_amd64.deb

## Install miniconda
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh \
        && bash ./miniconda.sh -b -p /opt/miniconda \
        && echo 'export PS1="\[\033[95m\]\u \[\033[32m\]\W\[\033[33m\] [\$(git symbolic-ref --short HEAD 2>/dev/null)]\[\033[00m\]\$ "' >> /etc/profile.d/ds.sh \
        && echo 'export PATH="/opt/miniconda/bin:$PATH"' >> /etc/profile.d/ds.sh \
        && chsh --shell /bin/bash docker

## install the last round of R packages
RUN R -e 'install.packages(c("rjags", "reticulate", "R2OpenBUGS"), repo = "https://cran.rstudio.com")'

LABEL maintainer="docker@5vcc.com"

EXPOSE 8787

ENTRYPOINT ["/init"]

