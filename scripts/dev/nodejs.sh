#!/bin/bash

cd $(dirname $0)

main() {
    if ! type mise > /dev/null 2>&1; then
        ./mise.sh
    fi
    mise install node@latest
    mise global node@latest
}

main
