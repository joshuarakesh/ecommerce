#!/bin/bash

# Variables
CONTAINER_NAME="react-app"
IMAGE_NAME="joshuarakesh/dev-react-app"

# Stop and remove any existing container
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Run the new container
docker run -d --name $CONTAINER_NAME -p 80:80 $IMAGE_NAME
