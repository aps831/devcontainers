FROM ghcr.io/aps831/devcontainers/base:latest

ENV USERNAME="vscode"

# Packages
RUN apt-get update && \
    apt-get -y install --no-install-recommends \
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
    liblzma-dev

RUN mkdir -p /home/vscode/.pyenv\
    && git clone "https://github.com/pyenv/pyenv.git" /home/vscode/.pyenv\
    && echo "system" > /home/vscode/.pyenv/version\
    && chown -R vscode:vscode /home/vscode/.pyenv\
    && pip install pipenv\
    && echo "export PYENV_ROOT=\"/home/vscode/.pyenv\"" >> /etc/bash.bashrc\
    && echo "PATH=\"\$PYENV_ROOT/bin:\$PATH\"" >> /etc/bash.bashrc\
    && echo "eval \"\$(pyenv init -)\"" >> /etc/bash.bashrc\
    && echo "eval \"\$(_PIPENV_COMPLETE=bash_source pipenv)\"" >> /etc/bash.bashrc

USER vscode
