FROM ghcr.io/aps831/devcontainers/base:latest

ENV USERNAME="vscode"

RUN mkdir -p /home/vscode/.goenv\
    && mkdir -p /home/vscode/.go\
    && git clone "https://github.com/syndbg/goenv" /home/vscode/.goenv\
    && echo "system" > /home/vscode/.goenv/version\
    && chown -R vscode:vscode /home/vscode/.goenv\
    && chown -R vscode:vscode /home/vscode/.go\
    && echo "export GOENV_ROOT=\"/home/vscode/.goenv\"" >> /etc/bash.bashrc\
    && echo "export GOENV_GOPATH_PREFIX=\"/home/vscode/.go\"" >> /etc/bash.bashrc\
    && echo "PATH=\$GOENV_ROOT/bin:\$PATH" >> /etc/bash.bashrc\
    && echo "eval \"\$(goenv init -)\"" >> /etc/bash.bashrc\
    && echo "export PATH=\"$GOROOT/bin:\$PATH\"" >> /etc/bash.bashrc\
    && echo "export PATH=\"\$PATH:\$GOPATH/bin\"" >> /etc/bash.bashrc

USER vscode
