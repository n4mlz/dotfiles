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

# if type batcat >/dev/null 2>&1; then
#     alias bat='batcat'
# fi

alias dk='docker'
