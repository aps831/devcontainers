ARG DEBIAN_VERSION=""
FROM mcr.microsoft.com/vscode/devcontainers/base:${DEBIAN_VERSION}

RUN apt-get update \
     && apt-get -y install --no-install-recommends \
        curl \
        wget \
        apt-transport-https \
        gnupg \
        lsb-release \
        python3-pip \
        python3-distutils
  
RUN wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add - \
    && echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list \
    && apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends trivy
    
WORKDIR /tmp
RUN wget -q "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -O "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install

RUN su vscode -c "pip install semgrep 2>&1"

USER vscode    