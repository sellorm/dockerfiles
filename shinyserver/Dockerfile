# Couchbase

FROM ubuntu

RUN apt update && apt upgrade -y && \
  apt install -y r-base r-base-dev build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev gdebi-core && \
  apt clean
RUN R --vanilla -e 'install.packages(c("shiny", "rmarkdown", "tidyverse", "rvest", "plumber"), repos="https://cran.rstudio.com")'
RUN curl -o shiny-server.deb https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.5.6.875-amd64.deb && \
  gdebi --non-interactive shiny-server.deb && \
  rm shiny-server.deb

ENTRYPOINT ["/opt/shiny-server/bin/shiny-server"]
