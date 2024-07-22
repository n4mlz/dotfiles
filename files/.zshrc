# init

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt incappendhistory

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
    alias ls='eza'
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

alias ll='ls -la'

alias dk='docker'
alias dcu='docker compose up -d'
alias dcd='docker compose down'

alias gdb='gdb -q'
