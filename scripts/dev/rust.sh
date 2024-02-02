#!/bin/bash

cd $(dirname $0)

main() {
    if ! type mise > /dev/null 2>&1; then
        ./mise.sh
    fi
    mise install -y rust@latest
    mise global rust@latest
}

main
