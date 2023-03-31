#!/bin/bash
DOCKER_NAME=springboot-demo
docker container stop $DOCKER_NAME
docker container rm $DOCKER_NAME
docker rmi 3u128/$DOCKER_NAME

docker run --pull always -p8080:80 --name $DOCKER_NAME -d 3u128/$DOCKER_NAME:latest