#!/bin/bash
docker run -d -p 3306:3306 \
  --name=mariadb_dckr \
  -v /home/dckr_data/mariaDB_dckr/data:/var/lib/mysql \
  mariadb
