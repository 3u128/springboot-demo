#!/bin/bash
DOCKER_NAME = springboot-demo
sudo docker container stop $DOCKER_NAME
sudo docker container rm $DOCKER_NAME
sudo docker rmi $DOCKER_NAME

