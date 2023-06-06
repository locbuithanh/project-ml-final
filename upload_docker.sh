#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=locbuii

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
echo "Logging in"
cat my_password.txt | docker login --username $dockerpath --password-stdin
name=$(docker images | grep 'project-ml' | xargs| cut -f 1 -d " ")
tag=$(docker images | grep 'project-ml' | xargs| cut -f 2 -d " ")
docker image tag "$name:$tag" "$dockerpath/$name:$tag"

# Step 3:
# Push image to a docker repository
docker image push "$dockerpath/$name:$tag"