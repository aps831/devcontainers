#! /bin/bash
IMAGE_NAME="ghcr.io/aps831/devcontainers/base:latest"
DEBIAN_VERSION="debian-11"
GITLEAKS_VERSION="8.5.1"
GIT_MKVER_VERSION="1.2.2"
NODE_VERSION="node_16.x"
docker build --build-arg DEBIAN_VERSION=$DEBIAN_VERSION \
             --build-arg GITLEAKS_VERSION=$GITLEAKS_VERSION \
             --build-arg GIT_MKVER_VERSION=$GIT_MKVER_VERSION \
             --build-arg NODE_VERSION=$NODE_VERSION \
             --progress=plain \
             --tag $IMAGE_NAME \
             .devcontainer
