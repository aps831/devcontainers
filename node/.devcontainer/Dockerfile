FROM ghcr.io/aps831/devcontainers/base:latest

ENV USERNAME="vscode"

COPY install_nvm.sh .

# Packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
        fontconfig \
        gettext-base

# Install nvm
ARG NVM_VERSION
ENV NVM_DIR="/usr/local/share/nvm"
RUN groupadd -r nvm \
   && usermod -a -G nvm ${USERNAME} \
   && umask 0002 \
   && mkdir -p ${NVM_DIR} \
   && chown :nvm ${NVM_DIR} \
   && chmod g+s ${NVM_DIR} \
   && su ${USERNAME} -c ". install_nvm.sh" \
   && echo "export NVM_DIR=\"$NVM_DIR\"" >> /etc/bash.bashrc \
   && echo "export PATH=$NVM_DIR/current/bin:\$PATH" >> /etc/bash.bashrc \
   && echo "[ -s $NVM_DIR/nvm.sh ] && . $NVM_DIR/nvm.sh" >> /etc/bash.bashrc \
   && echo "[ -s $NVM_DIR/bash_completion ] && . $NVM_DIR/bash_completion" >> /etc/bash.bashrc

# Install
RUN su vscode -c "umask 0002 && . $NVM_DIR/nvm.sh && nvm install lts/* 2>&1"
# RUN su vscode -c "umask 0002 && . $NVM_DIR/nvm.sh && npm install -g <package> 2>&1"

USER vscode
