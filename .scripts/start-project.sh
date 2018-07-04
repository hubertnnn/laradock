#!/bin/bash

MACHINE_NAME=docker-default

# Export docker .env variables
eval $(docker-machine env $MACHINE_NAME)

docker-compose up -d   nginx php-fpm mysql redis workspace horizon
docker-compose build   nginx php-fpm mysql redis workspace horizon
docker-compose restart nginx php-fpm mysql redis workspace horizon
docker-compose exec workspace make update
