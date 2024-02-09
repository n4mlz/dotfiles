#!/bin/bash

if [ "$EUID" -eq 0 ]; then
    echo "don't run as root"
    exit 1
fi

cd $(dirname $0)

apt_brew() {
    sudo apt install -y git binutils make gcc fakeroot wget curl which acpi vi vim less man neofetch strace ltrace build-essential ubuntu-advantage-tools
}

pacman_yay() {
    sudo pacman -S git binutils make gcc fakeroot wget curl which acpi vi vim less man neofetch strace ltrace --noconfirm
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
