# init

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_SPACE
setopt incappendhistory

export PATH="/home/n4mlz/.local/bin:$PATH"

if [ -e /home/linuxbrew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if type sheldon >/dev/null 2>&1; then
    eval "$(sheldon source)"
fi

if type starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

if type mise >/dev/null 2>&1; then
    eval "$(mise activate zsh)"
fi

if type zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

if type thefuck >/dev/null 2>&1; then
    eval $(thefuck --alias)
fi

# alias

if type dust >/dev/null 2>&1; then
    alias du='dust'
fi

if type bat >/dev/null 2>&1; then
    alias cat='bat'
fi

if type batcat >/dev/null 2>&1; then
    alias cat='batcat'
fi

if type eza >/dev/null 2>&1; then
    alias ls='eza --icons'
fi

if type fdfind >/dev/null 2>&1; then
    alias fd='fdfind'
fi

if type duf >/dev/null 2>&1; then
    alias df='duf'
fi

if type btm >/dev/null 2>&1; then
    alias top='btm'
fi

if type zoxide >/dev/null 2>&1; then
    alias cd='z'
fi

if type nvim >/dev/null 2>&1; then
    alias vim='nvim'
fi

if type colordiff >/dev/null 2>&1; then
    alias diff='colordiff -u'
fi

if type wl-copy >/dev/null 2>&1; then
    alias -g CC='wl-copy'
    alias -g CP='wl-paste'
fi

export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.cargo/bin

alias ll='ls -aahl --group-directories-first'
alias cl='(){cd $1 && ls}'
alias take='(){ mkdir -p $1 && cd $1 }'
alias cd.='cd "$(git rev-parse --show-toplevel)"'

alias g='git'

alias dk='docker'
alias dcu='docker compose up -d'
alias dcd='docker compose down'

alias gdb='gdb -q'

. "$HOME/.local/bin/env"
