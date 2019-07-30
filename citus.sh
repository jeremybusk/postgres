#!/bin/bash
# https://github.com/citusdata/citus

curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker $USER && exec sg docker newgrp `id -gn`
sudo systemctl start docker

sudo curl -sSL https://github.com/docker/compose/releases/download/1.11.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

curl -sSLO https://raw.githubusercontent.com/citusdata/docker/master/docker-compose.yml
docker-compose -p citus up -d

docker exec -it citus_master psql -U postgres

docker-compose -p citus down
