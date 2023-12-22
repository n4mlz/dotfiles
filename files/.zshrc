# Created by newuser for 5.8.1
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(sheldon source)"
eval "$(starship init zsh)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
