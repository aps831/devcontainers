# debian-11
FROM mcr.microsoft.com/vscode/devcontainers/base@sha256:4f24f81d634a7853f71e6b1291b27b35ee25f8a7e87951b187a2809aae1c9177

# Packages
RUN apt-get update \
     && apt-get -y install --no-install-recommends \
        bash-completion \
        fzf \
        fontconfig \
        gettext-base \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

# Git completion
RUN wget -q -O - https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > /etc/bash_completion.d/git-completion
