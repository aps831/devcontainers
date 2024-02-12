# debian-11
FROM mcr.microsoft.com/vscode/devcontainers/base@sha256:691e49f9553c20cd13dc3030daec47ad81a124a42049264ead32531d3af9f41f

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
