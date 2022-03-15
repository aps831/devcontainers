set -e
umask 0002
# Do not update profile - we'll do this manually
export PROFILE=/dev/null
curl -so- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash 
source ${NVM_DIR}/nvm.sh    
nvm clear-cache 