# debian-11
FROM mcr.microsoft.com/vscode/devcontainers/base@sha256:33ff3550308c99ea0e0d63b61a03e8590588aee7c15c83077cb3cebed49a8861

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
