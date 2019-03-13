#!/bin/bash
docker image rmi apache_dckr
docker build -t apache_dckr .
