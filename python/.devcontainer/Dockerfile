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
    liblzma-dev\
    python3-venv

# Install globally before Python environments
RUN pip install --no-cache-dir safety

RUN mkdir -p /home/vscode/.pyenv\
    && git clone "https://github.com/pyenv/pyenv.git" /home/vscode/.pyenv\
    && echo "system" > /home/vscode/.pyenv/version\
    && chown -R vscode:vscode /home/vscode/.pyenv\
    && echo "export PYENV_ROOT=\"/home/vscode/.pyenv\"" >> /etc/bash.bashrc\
    && echo "PATH=\"\$PYENV_ROOT/bin:\$PATH\"" >> /etc/bash.bashrc\
    && su vscode -c "curl -sSL https://install.python-poetry.org | python3 - "\
    && echo "PATH=\"/home/vscode/.local/bin:\$PATH\"" >> /etc/bash.bashrc\
    && /home/vscode/.local/bin/poetry completions bash >> /etc/bash.bashrc

USER vscode
