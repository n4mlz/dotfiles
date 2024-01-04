#!/bin/bash

cd $(dirname $0)

main() {
    if ! command -v mise &>/dev/null; then
        ./mise.sh
    fi
    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
        libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
        libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
    mise install python@latest
    mise global python@latest
    mise install poetry@latest
    mise global poetry@latest
}

main
