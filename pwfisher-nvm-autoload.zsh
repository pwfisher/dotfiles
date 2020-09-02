# https://github.com/nvm-sh/nvm#calling-nvm-use-automatically-in-a-directory-with-a-nvmrc-file
load_nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

# Based on https://www.growingwiththeweb.com/2018/01/slow-nvm-init.html
# Defer nvm init (w/ .nvmrc) until node-dependent command is run
if [ -s "$HOME/.nvm/nvm.sh" ] && ! typeset -f __init_nvm >/dev/null; then
  export NVM_DIR="$HOME/.nvm"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'jest')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    unset __node_commands
    unset -f __init_nvm
    . "$NVM_DIR"/nvm.sh
    load_nvmrc
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi
