#!/bin/bash

if [ "$EUID" -eq 0 ]; then
    echo "don't run as root"
    exit 1
fi

cd $(dirname $0)

apt_brew() {
    if [ ! -d /home/linuxbrew ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    sudo chmod -R u+x /home/linuxbrew
}

pacman_yay() {
    echo "skip brew install"
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
