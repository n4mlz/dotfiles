#!/bin/bash

cd $(dirname $0)

ubuntu() {
    sudo apt install -y curl wget git zsh vim build-essential ubuntu-advantage-tools
    if ! command -v brew &>/dev/null; then
        if [ ! -d /home/linuxbrew ]; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        sudo chmod -R u+x /home/linuxbrew
    fi
    brew install sheldon
    brew install starship
}

arch() {
    # install scripts
    echo "not supported yet"
}

install() {
    if command -v apt &>/dev/null; then
        echo "using ubuntu mode..."
        ubuntu
    elif command -v pacman &>/dev/null; then
        echo "using arch mode..."
        arch
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
