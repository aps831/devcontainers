ARG DEBIAN_VERSION=""
FROM mcr.microsoft.com/vscode/devcontainers/base:${DEBIAN_VERSION}

# Packages
RUN apt-get update \
     && apt-get -y install --no-install-recommends \
        curl \
        wget \
        apt-transport-https \
        gnupg \
        lsb-release \
        python3-pip \
        python3-distutils

# Node
ARG NODE_VERSION
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor >> /usr/share/keyrings/nodesource.gpg \
    && gpg --no-default-keyring --keyring /usr/share/keyrings/nodesource.gpg --list-keys \
    && echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/$NODE_VERSION $(lsb_release -sc) main" > /etc/apt/sources.list.d/nodesource.list \
    && echo "deb-src [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/$NODE_VERSION $(lsb_release -sc) main" >> tee -a /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends nodejs

# Trivy
RUN wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add - \
    && echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list \
    && apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends trivy

# Gitleaks
ARG GITLEAKS_VERSION
RUN curl -sSL https://github.com/zricethezav/gitleaks/releases/download/v${GITLEAKS_VERSION}/gitleaks_${GITLEAKS_VERSION}_linux_x64.tar.gz | tar xvz \
    && chmod +x gitleaks \
    && mv gitleaks /usr/local/bin

# Git Mkver
ARG GIT_MKVER_VERSION
RUN curl -L https://github.com/idc101/git-mkver/releases/download/v${GIT_MKVER_VERSION}/git-mkver-linux-amd64-${GIT_MKVER_VERSION}.tar.gz | tar xvz \
    && mv git-mkver /usr/local/bin

# Semgrep & Pre-Commit
RUN su vscode -c "pip install --no-warn-script-location semgrep pre-commit 2>&1"
