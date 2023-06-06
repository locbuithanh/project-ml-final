#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=locbuii

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy project-ml --image=locbuii/project-ml:v1.0.0


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment.apps/project-ml 8000:80
