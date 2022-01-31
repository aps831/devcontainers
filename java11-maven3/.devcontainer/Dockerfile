ARG JAVA_VERSION=""
FROM mcr.microsoft.com/vscode/devcontainers/java:0-${JAVA_VERSION}

COPY --chown=vscode:vscode settings.xml "/home/vscode/.m2/settings.xml"

ARG MAVEN_VERSION=""
RUN su vscode -c "umask 0002 && . /usr/local/sdkman/bin/sdkman-init.sh && sdk install maven \"${MAVEN_VERSION}\""
    
ARG NODE_VERSION=""
RUN su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
        fontconfig \
        curl \
        wget \
        apt-transport-https \
        gnupg \
        lsb-release \        
        python3-distutils \
        python3-pip \     
        gettext-base \
    && su vscode -c "python3 -m pip install setuptools && python3 -m pip install semgrep 2>&1" \
    && wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add - \
    && echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list \
    && apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends trivy

RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g github-release-notes 2>&1"