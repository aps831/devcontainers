# debian-11
FROM mcr.microsoft.com/vscode/devcontainers/base@sha256:2dc12d442d16dd3a8889eb8af8c7085c2ae693dca6d9912bfbf42fda5342c47a

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
