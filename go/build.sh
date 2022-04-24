#! /bin/bash
IMAGE_NAME="ghcr.io/aps831/devcontainers/go:latest"
npx -p @vscode/dev-container-cli devcontainer build --image-name "$IMAGE_NAME" .
