#!/bin/sh
cd ../aq_perf/
git fetch origin
git reset --hard
git pull origin develop
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker-compose build --no-cache
