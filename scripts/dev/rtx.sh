#!/bin/bash

main() {
    sudo install -dm 755 /etc/apt/keyrings
    wget -qO - https://rtx.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/rtx-archive-keyring.gpg 1>/dev/null
    echo "deb [signed-by=/etc/apt/keyrings/rtx-archive-keyring.gpg arch=amd64] https://rtx.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/rtx.list
    sudo apt update
    sudo apt install -y rtx
}

main
