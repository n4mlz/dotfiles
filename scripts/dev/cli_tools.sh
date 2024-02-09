#!/bin/bash

if [ "$EUID" -eq 0 ]; then
    echo "don't run as root"
    exit 1
fi

cd $(dirname $0)

# dust(du), bat(cat), eza(ls), fd(find), duf(df), procs(ps),
# bottom(top), zoxide(cd), ripgrep(grep), httpie(curl)

apt_brew() {
    sudo apt install -y bat fd-find duf zoxide ripgrep

    sudo apt install -y gpg
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo apt update
    sudo apt install -y eza

    if ! command -v brew &>/dev/null; then
        ./brew.sh
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
    brew tap tgotwig/linux-dust && brew install dust
    brew install procs bottom httpie
}

pacman_yay() {
    sudo pacman -S dust bat eza fd duf procs bottom zoxide ripgrep httpie --noconfirm
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
