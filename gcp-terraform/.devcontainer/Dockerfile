ARG DEBIAN_VERSION=""
FROM mcr.microsoft.com/vscode/devcontainers/base:${DEBIAN_VERSION}

ARG CLOUD_SDK_VERSION=""
ENV CLOUD_SDK_VERSION=$CLOUD_SDK_VERSION
ENV PATH "$PATH:/opt/google-cloud-sdk/bin/"

RUN apt-get update \
    && apt-get install -qqy \        
        wget \            
        curl \
        gcc \
        python3-dev \
        python3-pip \
        python3-distutils \
        apt-transport-https \
        lsb-release \
        openssh-client \        
        gnupg
    
RUN wget -qO - https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
    && wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add - \
    && echo "deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list \
    && echo "deb https://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" > /etc/apt/sources.list.d/google-cloud-sdk.list \
    && apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        trivy \
        google-cloud-sdk=${CLOUD_SDK_VERSION}-0 \
    && gcloud config set core/disable_usage_reporting true \
    && gcloud config set component_manager/disable_update_check true \
    && gcloud config set metrics/environment github_docker_image       

RUN su vscode -c "pip install crcmod semgrep 2>&1"
USER vscode

    