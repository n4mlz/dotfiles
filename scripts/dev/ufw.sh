#!/bin/bash

if [ "$EUID" -eq 0 ]; then
    echo "don't run as root"
    exit 1
fi

cd $(dirname $0)

apt_brew() {
    echo "apt: not supported yet"
}

pacman_yay() {
    sudo pacman -S ufw
    setting
}

setting() {
    sudo systemctl enable ufw
    sudo systemctl start ufw
    sudo ufw enable
    sudo ufw default deny
    sudo ufw allow from 192.168.0.0/24
    sudo ufw limit ssh
}

main() {
    if [[ "$(uname -r)" == *microsoft* ]]; then
        echo "wsl: skip install"
    elif [ -e /.dockerenv ]; then
        echo "docker: skip install"
    else
        if command -v apt &>/dev/null; then
            echo "using apt and brew..."
            apt_brew
        elif command -v pacman &>/dev/null; then
            echo "using pacman and yay..."
            pacman_yay
        else
            echo "pm not found"
        fi
    fi
}

main
