FROM ghcr.io/aps831/devcontainers/base:latest

ENV USERNAME="vscode"

COPY --chown=vscode:vscode settings.xml "/home/vscode/.m2/settings.xml"

# Packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
        fontconfig \
        gettext-base

# Install sdkman
ENV SDKMAN_DIR="/usr/local/sdkman"
RUN groupadd -r sdkman \
    && usermod -a -G sdkman ${USERNAME} \
    && umask 0002 \
    && curl -sSL "https://get.sdkman.io?rcupdate=false" | bash \
    && chown -R :sdkman ${SDKMAN_DIR} \
    && find ${SDKMAN_DIR} -type d | xargs -d '\n' chmod g+s \
    && echo "export SDKMAN_DIR=$SDKMAN_DIR" >> /etc/bash.bashrc \
    && echo "export PATH=$SDKMAN_DIR/candidates/java/current/bin:$SDKMAN_DIR/candidates/maven/current/bin:\$PATH" >> /etc/bash.bashrc \
    && echo ". $SDKMAN_DIR/bin/sdkman-init.sh" >> /etc/bash.bashrc \
    && sed -i '/sdkman_auto_env=false/c sdkman_auto_env=true' $SDKMAN_DIR/etc/config

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
RUN su vscode -c "umask 0002 && . $SDKMAN_DIR/bin/sdkman-init.sh && sdk install java 2>&1 && sdk install maven 2>&1"

USER vscode
