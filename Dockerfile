FROM ubuntu:latest

RUN apt-get update

# git

RUN apt-get install -y git

# zsh

RUN apt-get install -y zsh

RUN chsh -s /bin/zsh

# curl

RUN apt-get install -y curl

# sheldon

RUN curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin

ENV PATH $PATH:~/.local/bin

RUN echo 'y' | sheldon init --shell zsh

# starship

RUN curl -o starship.sh https://starship.rs/install.sh

RUN  sh starship.sh -f

RUN rm starship.sh

# vim

RUN apt-get install vim

# dotfiles

RUN git clone https://github.com/Nameless-itf23/dotfiles.git

RUN ./dotfiles/scripts/deploy.sh
