ARG NODE_VERSION=
FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:0-${NODE_VERSION}

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
      curl \
      wget \
      apt-transport-https \
      gnupg \
      lsb-release \
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
      xvfb \
      python3-distutils \
      python3-pip \
      gettext-base \
    && su node -c "python3 -m pip install setuptools && python3 -m pip install semgrep 2>&1" \
    && wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add - \
    && echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list \
    && apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends trivy \
    && cd /tmp \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install

RUN su node -c "source /usr/local/share/nvm/nvm.sh && npm install -g github-release-notes" 2>&1