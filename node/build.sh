#! /bin/bash
IMAGE_NAME="ghcr.io/aps831/devcontainers/node:latest"
npx -p @vscode/dev-container-cli@latest devcontainer build --image-name "${IMAGE_NAME}" .
