#!/bin/bash

if [ "$EUID" -eq 0 ]; then
    echo "don't run as root"
    exit 1
fi

cd $(dirname $0)

apt_brew() {
    sudo apt install -y curl wget git zsh vim build-essential ubuntu-advantage-tools
}

pacman_yay() {
    sudo pacman -S curl wget git zsh vim --noconfirm
}

install() {
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

deploy() {
    ./deploy.sh
    sudo chsh -s /bin/zsh
}

main() {
    install
    deploy
}

main
