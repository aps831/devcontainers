FROM ghcr.io/aps831/devcontainers/base:latest

ENV USERNAME="vscode"

ARG NANCY_VERSION
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN su vscode -c ". /home/${USERNAME}/.asdf/asdf.sh && asdf plugin add golang https://github.com/kennyp/asdf-golang.git" \
    && curl -sSL https://github.com/sonatype-nexus-community/nancy/releases/download/v${NANCY_VERSION}/nancy-v${NANCY_VERSION}-linux-amd64.tar.gz | tar xvz \
    && chmod +x nancy \
    && mv nancy /usr/local/bin \
    && apt-get -y install --no-install-recommends build-essential

COPY --chown=vscode:vscode default-golang-pkgs "/home/${USERNAME}/.default-golang-pkgs"

USER vscode
