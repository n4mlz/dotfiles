#!/bin/bash

cd $(dirname $0)

apt_brew() {
  sudo apt install -y curl wget git zsh vim build-essential
  if ! command -v brew &>/dev/null; then
    if [ ! -d /home/linuxbrew ]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    sudo chmod -R 777 /home/linuxbrew
  fi
  brew install sheldon
  brew install starship
}

pacman_yay() {
  # install scripts
  echo "not supported yet"
}

install() {
  if command -v apt &>/dev/null; then
    echo "using apt and brew..."
    apt_brew
  elif command -v pacman &>/dev/null; then
    echo "using pacman and yay..."
    pacman_yay
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
