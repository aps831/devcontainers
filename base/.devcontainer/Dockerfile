# debian-11
FROM mcr.microsoft.com/vscode/devcontainers/base@sha256:98a855f963d5d3ec742a7b94827b24b4f513fe5f5e010fbbb8654bafda6d498b

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
