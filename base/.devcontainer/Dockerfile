# debian-11
FROM mcr.microsoft.com/vscode/devcontainers/base@sha256:d070674b0bf615e732bab60dedeeea82b0cc62186d8a63b93ba2df065ad77f4e

# Packages
RUN apt-get update \
     && apt-get -y install --no-install-recommends \
        age \
        bash-completion \
        fzf \
        fontconfig \
        gettext-base \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

# Git completion
RUN wget -q -O - https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > /etc/bash_completion.d/git-completion
