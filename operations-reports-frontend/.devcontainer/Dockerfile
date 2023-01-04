FROM ghcr.io/aps831/devcontainers/base:latest
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
      libgtk2.0-0 \
      libgtk-3-0 \
      libgbm-dev \
      libnotify-dev \
      libgconf-2-4 \
      libnss3 \
      libxss1 \
      libasound2 \
      libxtst6 \
      xauth \
      xvfb
USER vscode
