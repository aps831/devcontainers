FROM ghcr.io/aps831/devcontainers/base:latest
# Python build dependency packages required for asdf
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
       make\
       build-essential\
       libssl-dev\
       zlib1g-dev\
       libbz2-dev\
       libreadline-dev\
       libsqlite3-dev\
       llvm\
       libncursesw5-dev\
       xz-utils\
       tk-dev\
       libxml2-dev\
       libxmlsec1-dev\
       libffi-dev\
       liblzma-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY --chown=vscode:vscode config.toml "/home/vscode/.config/pypoetry/config.toml"
USER vscode
