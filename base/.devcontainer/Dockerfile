# debian-11
FROM mcr.microsoft.com/vscode/devcontainers/base@sha256:eb54c7935538ce8a63092a53d61c95f8cebc19921de2df6bc65dc606d8e5bb1d

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
