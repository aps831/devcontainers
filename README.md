# Devcontainers

This project defines devcontainer images for:

* ansible;
* aws-terraform;
* gcp-terraform;
* java8-maven3;
* java11-maven3;
* java17-maven3;
* operations-reports-backend;
* operations-reports-frontend.

User specific config should be completed using a public dotfiles repository.  For example, https://github.com/aps831/dotfiles.

Current known limitations with using devcontainers in VS Code are:

* SSH keys that use a smart card do not work;
* Surefire configuration is not passed to the Java test runner.