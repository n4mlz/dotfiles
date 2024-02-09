#!/bin/bash

if [ "$EUID" -eq 0 ]; then
    echo "don't run as root"
    exit 1
fi

cd $(dirname $0)

apt_brew() {
    if ! command -v brew &>/dev/null; then
        ./brew.sh
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
    brew install sheldon
}

pacman_yay() {
    yay -S sheldon --nodiffmenu --combinedupgrade --sudoloop --noconfirm
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

main "$@"
