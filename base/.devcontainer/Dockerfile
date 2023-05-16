# debian-11
FROM mcr.microsoft.com/vscode/devcontainers/base@sha256:668c322e26e7721a39fc099525e0b5c52590b8642a56e3517423578882cbba87

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
