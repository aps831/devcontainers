# debian-11
FROM mcr.microsoft.com/vscode/devcontainers/base@sha256:14f3c9b1efb5c5718e1b5cb5d1d48db964493e9dafeb107dfb3903ed98c78662

# Packages
RUN apt-get update \
     && apt-get -y install --no-install-recommends \
        age \
        bash-completion \
        fzf \
        fontconfig \
        gettext-base \
        fakeroot \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

# Git completion
RUN wget -q -O - https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > /etc/bash_completion.d/git-completion
