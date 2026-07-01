#!/bin/bash
set -e

APP_DIR=/home/ec2-user/final-python-app
CONTAINER_NAME=final-python-container
IMAGE_NAME=amrotr/final-python-app:latest

cd $APP_DIR

# Stop and remove existing container if it exists
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
  docker rm -f $CONTAINER_NAME || true
fi

# Pull latest image from Docker Hub
docker pull $IMAGE_NAME

# Run new container, mapping port 80 on EC2 to port 5000 in container
docker run -d -p 80:5000 --name $CONTAINER_NAME $IMAGE_NAME