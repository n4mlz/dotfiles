#!/bin/bash

apt_brew() {
    sudo install -dm 755 /etc/apt/keyrings
    wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1>/dev/null
    echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=amd64] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
    sudo apt update
    sudo apt install -y mise
}

pacman_yay() {
    # install scripts
    echo "not supported yet"
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
