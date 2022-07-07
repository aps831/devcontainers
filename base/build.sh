#! /bin/bash
IMAGE_NAME="ghcr.io/aps831/devcontainers/base:latest"
DEBIAN_VERSION="debian-11"
GITLEAKS_VERSION="8.8.2"
GIT_MKVER_VERSION="1.2.2"
NODE_VERSION="node_16.x"
DELTA_VERSION="0.12.1"
ASDF_VERION="0.10.0"
docker build --build-arg DEBIAN_VERSION=$DEBIAN_VERSION \
  --build-arg GITLEAKS_VERSION=$GITLEAKS_VERSION \
  --build-arg GIT_MKVER_VERSION=$GIT_MKVER_VERSION \
  --build-arg NODE_VERSION=$NODE_VERSION \
  --build-arg DELTA_VERSION=$DELTA_VERSION \
  --build-arg ASDF_VERSION="${ASDF_VERION}" \
  --progress=plain \
  --tag $IMAGE_NAME \
  .devcontainer
