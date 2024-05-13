# debian-11
FROM mcr.microsoft.com/vscode/devcontainers/base@sha256:f4860362e59f0e1bb7d5a08486e528f29f617cfc5987e54613e6df20b436ff36

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
