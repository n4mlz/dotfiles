#!/bin/bash

cd $(dirname $0)

main() {
    if ! command -v rtx &>/dev/null; then
        ./rtx.sh
    fi
    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
        libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
        libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
    rtx install python@latest
    rtx global python@latest
}

main
