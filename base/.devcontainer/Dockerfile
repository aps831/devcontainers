ARG DEBIAN_VERSION=""
FROM mcr.microsoft.com/vscode/devcontainers/base:${DEBIAN_VERSION}

# Packages
RUN apt-get update \
     && apt-get -y install --no-install-recommends \
        bash-completion \
        curl \
        wget \
        apt-transport-https \
        gnupg \
        lsb-release \
        python3-pip \
        python3-distutils \
        fzf \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

# Node
ARG NODE_VERSION
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN wget -q -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor >> /usr/share/keyrings/nodesource.gpg \
    && gpg --no-default-keyring --keyring /usr/share/keyrings/nodesource.gpg --list-keys \
    && echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/$NODE_VERSION $(lsb_release -sc) main" > /etc/apt/sources.list.d/nodesource.list \
    && echo "deb-src [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/$NODE_VERSION $(lsb_release -sc) main" >> /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends nodejs  \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Trivy
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN wget -q -O - "https://aquasecurity.github.io/trivy-repo/deb/public.key" | apt-key add - \
    && echo "deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" > /etc/apt/sources.list.d/trivy.list \
    && apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends trivy \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Git tools
ARG DELTA_VERSION
ARG GITLEAKS_VERSION
ARG GIT_MKVER_VERSION
RUN wget -q -O - https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > /etc/bash_completion.d/git-completion \
    && wget -q -O delta.deb https://github.com/dandavison/delta/releases/download/${DELTA_VERSION}/git-delta_${DELTA_VERSION}_amd64.deb && dpkg -i delta.deb \
    && wget -q -O - https://github.com/zricethezav/gitleaks/releases/download/v${GITLEAKS_VERSION}/gitleaks_${GITLEAKS_VERSION}_linux_x64.tar.gz | tar xvz \
    && chmod +x gitleaks \
    && mv gitleaks /usr/local/bin \
    && wget -q -O - https://github.com/idc101/git-mkver/releases/download/v${GIT_MKVER_VERSION}/git-mkver-linux-amd64-${GIT_MKVER_VERSION}.tar.gz | tar xvz \
    && mv git-mkver /usr/local/bin

# Python and NPM tools
# hadolint ignore=DL3016
RUN pip install --no-cache-dir --no-warn-script-location semgrep pre-commit virtualenv \
    && npm -g install commitizen cz-conventional-changelog

# Asdf
ARG ASDF_VERSION
RUN git clone https://github.com/asdf-vm/asdf.git /home/vscode/.asdf --branch v${ASDF_VERSION} \
    && chown vscode:vscode -R /home/vscode/.asdf \
    && echo ". /home/vscode/.asdf/asdf.sh" >> /etc/bash.bashrc \
    && cat /home/vscode/.asdf/completions/asdf.bash > /etc/bash_completion.d/asdf.bash
