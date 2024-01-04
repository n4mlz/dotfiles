#!/bin/bash

cd $(dirname $0)

main() {
    if ! command -v mise &>/dev/null; then
        ./mise.sh
    fi
    mise install node@latest
    mise global node@latest
}

main
