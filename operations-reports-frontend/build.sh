#! /bin/bash
IMAGE_NAME="ghcr.io/aps831/devcontainers/operations-reports-frontend:latest"
npx --yes -p @vscode/dev-container-cli@latest devcontainer build --image-name "${IMAGE_NAME}" .
