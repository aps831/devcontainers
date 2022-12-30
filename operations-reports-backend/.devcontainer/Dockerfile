FROM ghcr.io/aps831/devcontainers/base:latest
ENV USERNAME="vscode"
COPY --chown=vscode:vscode settings.xml "/home/${USERNAME}/.m2/settings.xml"
USER vscode
