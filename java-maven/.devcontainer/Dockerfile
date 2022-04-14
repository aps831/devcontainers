FROM ghcr.io/aps831/devcontainers/base:latest

ENV USERNAME="vscode"

COPY --chown=vscode:vscode settings.xml "/home/${USERNAME}/.m2/settings.xml"

# Packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
        fontconfig \
        gettext-base

# Install sdkman
ENV SDKMAN_DIR="/usr/local/sdkman"
RUN groupadd -r sdkman \
    && usermod -a -G sdkman ${USERNAME} \
    && umask 0002 \
    && curl -sSL "https://get.sdkman.io?rcupdate=false" | bash \
    && chown -R :sdkman ${SDKMAN_DIR} \
    && find ${SDKMAN_DIR} -type d | xargs -d '\n' chmod g+s \
    && echo "export SDKMAN_DIR=$SDKMAN_DIR" >> /etc/bash.bashrc \
    && echo "export PATH=$SDKMAN_DIR/candidates/java/current/bin:$SDKMAN_DIR/candidates/maven/current/bin:\$PATH" >> /etc/bash.bashrc \
    && echo ". $SDKMAN_DIR/bin/sdkman-init.sh" >> /etc/bash.bashrc \
    && sed -i '/sdkman_auto_env=false/c sdkman_auto_env=true' $SDKMAN_DIR/etc/config

# Install
RUN su vscode -c "umask 0002 && . $SDKMAN_DIR/bin/sdkman-init.sh && sdk install java 2>&1 && sdk install maven 2>&1"

USER vscode
