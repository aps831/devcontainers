ARG DEBIAN_VERSION=""
FROM mcr.microsoft.com/vscode/devcontainers/base:${DEBIAN_VERSION}

ENV USERNAME="vscode"

COPY install_nvm.sh .

# Packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
      curl \
      wget \
      apt-transport-https \
      gnupg \
      lsb-release \
      libgtk2.0-0 \
      libgtk-3-0 \
      libgbm-dev \
      libnotify-dev \
      libgconf-2-4 \
      libnss3 \
      libxss1 \
      libasound2 \
      libxtst6 \
      xauth \
      xvfb \
      python3-distutils \
      python3-pip \
      gettext-base

# Trivy
RUN wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add - \
    && echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list \
    && apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends trivy

# Install nvm
ARG NVM_VERSION
ENV NVM_DIR="/usr/local/share/nvm"
RUN groupadd -r nvm \
   && usermod -a -G nvm ${USERNAME} \
   && umask 0002 \
   && mkdir -p ${NVM_DIR} \
   && chown :nvm ${NVM_DIR} \
   && chmod g+s ${NVM_DIR} \
   && su ${USERNAME} -c ". install_nvm.sh" \
   && echo "export NVM_DIR=\"$NVM_DIR\"" >> /etc/bash.bashrc \
   && echo "export PATH=$NVM_DIR/current/bin:\$PATH" >> /etc/bash.bashrc \
   && echo "[ -s $NVM_DIR/nvm.sh ] && . $NVM_DIR/nvm.sh" >> /etc/bash.bashrc \
   && echo "[ -s $NVM_DIR/bash_completion ] && . $NVM_DIR/bash_completion" >> /etc/bash.bashrc

# AWS
WORKDIR /tmp
RUN wget -q "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -O "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install

# Git Mkver
ARG GIT_MKVER_VERSION
RUN curl -L https://github.com/idc101/git-mkver/releases/download/v${GIT_MKVER_VERSION}/git-mkver-linux-amd64-${GIT_MKVER_VERSION}.tar.gz | tar xvz \
    && mv git-mkver /usr/local/bin

# Tfenv
ENV TFENV_DIR="/usr/local/share/tfenv"
RUN groupadd -r tfenv \
   && usermod -a -G tfenv ${USERNAME} \
   && umask 0002 \
   && mkdir -p ${TFENV_DIR} \
   && chown :tfenv ${TFENV_DIR} \
   && chmod g+s ${TFENV_DIR} \
   && su ${USERNAME} -c "git clone https://github.com/tfutils/tfenv.git ${TFENV_DIR}" \
   && echo "export TFENV_DIR=\"$TFENV_DIR\"" >> /etc/bash.bashrc \
   && echo "export PATH=$TFENV_DIR/bin:\$PATH" >> /etc/bash.bashrc    

# Terraform tools
ARG TERRAFORM_DOCS_VERSION
ARG TFLINT_VERSION
ARG TFSEC_VERSION
RUN curl -sSL https://terraform-docs.io/dl/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-$(uname)-amd64.tar.gz | tar xvz \
    && chmod +x terraform-docs \
    && mv terraform-docs /usr/local/bin \ 
    && tmpfile=$(mktemp) \
    && curl -sSL https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip -o $tmpfile \
    && unzip $tmpfile \ 
    && chmod +x tflint \
    && mv tflint /usr/local/bin \
    && rm $tmpfile \
    && curl -sSL https://github.com/aquasecurity/tfsec/releases/download/v${TFSEC_VERSION}/tfsec-linux-amd64 -o tfsec \
    && chmod +x tfsec \
    && mv tfsec /usr/local/bin/tfsec   

# Gitleaks
ARG GITLEAKS_VERSION
RUN curl -sSL https://github.com/zricethezav/gitleaks/releases/download/v${GITLEAKS_VERSION}/gitleaks_${GITLEAKS_VERSION}_linux_x64.tar.gz | tar xvz \
    && chmod +x gitleaks \
    && mv gitleaks /usr/local/bin      

# Install
#RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <package>" 2>&1
RUN su vscode -c "python3 -m pip install setuptools && python3 -m pip install semgrep pre-commit 2>&1"

USER vscode