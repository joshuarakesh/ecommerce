#!/bin/bash

# Variables
IMAGE_NAME="joshuarakesh/dev-react-app"

# Build the Docker image
docker build -t $IMAGE_NAME .

# Authenticate Docker
docker login

# Push to Docker Hub
docker push $IMAGE_NAME
