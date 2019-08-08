#!/bin/bash

sudo apt install -y vim wget
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# Add repository:
RELEASE=$(lsb_release -cs)
echo "deb http://apt.postgresql.org/pub/repos/apt/ ${RELEASE}"-pgdg main | sudo tee  /etc/apt/sources.list.d/pgdg.list
# Update system and install pgAdmin4 on Debian 10 Buster.
sudo apt update
sudo apt -y install pgadmin4 pgadmin4-apache2
# Setup initial user/pass combo for http ui
