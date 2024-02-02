#!/bin/bash

# dust(du), bat(cat), exa(ls), fd(find), duf(df), procs(ps), 
# bottom(top), zoxide(cd), ripgrep(grep), httpie(curl)

apt_brew() {
    sudo apt install -y bat exa fd-find duf zoxide ripgrep
    if ! command -v brew &>/dev/null; then
        ./brew.sh
    fi
    brew tap tgotwig/linux-dust && brew install dust
    brew install procs bottom httpie
}

pacman_yay() {
    sudo pacman -S dust bat exa fd duf procs bottom zoxide ripgrep httpie --noconfirm
}

main() {
    if command -v apt &>/dev/null; then
        echo "using apt and brew..."
        apt_brew
    elif command -v pacman &>/dev/null; then
        echo "using pacman and yay..."
        pacman_yay
    else
        echo "pm not found"
    fi
}

main
