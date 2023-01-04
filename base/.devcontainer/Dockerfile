ARG DEBIAN_VERSION=""
FROM mcr.microsoft.com/vscode/devcontainers/base:${DEBIAN_VERSION}

# Packages
RUN apt-get update \
     && apt-get -y install --no-install-recommends \
        bash-completion \
        python3-pip \
        python3-distutils \
        python3-dev \
        fzf \
        fontconfig \
        gettext-base \
        gcc \
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

# Git completion
RUN wget -q -O - https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > /etc/bash_completion.d/git-completion
