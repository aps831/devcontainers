# debian-11
FROM mcr.microsoft.com/vscode/devcontainers/base@sha256:800ed0a5e8679cf1bd2a1ec1ef01d35cc497d6fda21ed8811b04fb9f938def6e

# Packages
RUN apt-get update \
     && apt-get -y install --no-install-recommends \
        age \
        bash-completion \
        fzf \
        fontconfig \
        gettext-base \
        fakeroot \
        firefox-esr \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

# Git completion
RUN wget -q -O - https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > /etc/bash_completion.d/git-completion
