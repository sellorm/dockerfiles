#!/usr/bin/env bash
docker run -v $(PWD):/srv/shiny-server -p 3838:3838 sellorm/shinyserver
