#!/bin/bash

cd $(dirname $0)

main() {
    if ! command -v mise &>/dev/null; then
        ./mise.sh
    fi
    mise install -y java@latest
    mise global java@latest
}

main
