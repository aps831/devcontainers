FROM ghcr.io/aps831/devcontainers/base:latest

ENV USERNAME="vscode"

# Packages
RUN apt-get update \
    && apt-get install -qqy \
        gcc \
        python3-dev \
        openssh-client

# GCloud
ARG CLOUD_SDK_VERSION
RUN wget -qO - https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
    && echo "deb https://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" > /etc/apt/sources.list.d/google-cloud-sdk.list \
    && apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends google-cloud-sdk=${CLOUD_SDK_VERSION}-0 \
    && gcloud config set core/disable_usage_reporting true \
    && gcloud config set component_manager/disable_update_check true \
    && gcloud config set metrics/environment github_docker_image \
    && echo "export CLOUD_SDK_VERSION=\"$CLOUD_SDK_VERSION\"" >> /etc/bash.bashrc \
    && echo "export PATH=/opt/google-cloud-sdk/bin/:\$PATH" >> /etc/bash.bashrc

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

# crcmod
RUN su vscode -c "pip install crcmod 2>&1"

USER vscode
