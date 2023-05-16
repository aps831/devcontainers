# debian-11
FROM mcr.microsoft.com/vscode/devcontainers/base@sha256:547a050dcfabd12be89ec3ed62ebadfc8b0b215361ba76c4a710776ef45074de

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
