#!/bin/bash

if [ "$EUID" -eq 0 ]; then
    echo "don't run as root"
    exit 1
fi

cd $(dirname $0)

main() {
    if ! type mise > /dev/null 2>&1; then
        ./mise.sh
    fi
    mise install -y rust@latest
    mise global rust@latest
}

main
