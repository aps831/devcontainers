FROM ghcr.io/aps831/devcontainers/base:latest

ENV USERNAME="vscode"

COPY install_nvm.sh .

# Packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
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
      gettext-base

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

# Install
#RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <package>" 2>&1

USER vscode
