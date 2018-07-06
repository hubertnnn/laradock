#!/bin/bash

MACHINE_NAME=docker-default

#Run machine if not running yet
docker-machine start $MACHINE_NAME

# Export docker .env variables
eval $(docker-machine env $MACHINE_NAME)

docker system prune
docker volume rm $(docker volume ls -qf dangling=true)
docker rmi $(docker images -q -f "dangling=true")
