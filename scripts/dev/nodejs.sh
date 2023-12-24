#!/bin/bash

cd $(dirname $0)

main() {
    if ! command -v rtx &>/dev/null; then
        ./rtx.sh
    fi
    rtx install node@latest
    rtx global node@latest
}

main
