FROM ubuntu:latest

WORKDIR /opt

RUN apt-get update

# git

RUN apt-get install -y git

# zsh

RUN apt-get install -y zsh

RUN chsh -s /bin/zsh

# curl

RUN apt-get install -y curl

# sheldon

RUN mkdir -p /opt/.local/bin

RUN curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- --repo rossmacarthur/sheldon --to /opt/.local/bin

ENV PATH $PATH:/opt/.local/bin

RUN echo 'y' | sheldon init --shell zsh

# starship

RUN curl -o starship.sh https://starship.rs/install.sh

RUN  sh starship.sh -f

RUN rm starship.sh

# vim

RUN apt-get install -y vim

# dotfiles

RUN git clone https://github.com/Nameless-itf23/dotfiles.git

RUN ./dotfiles/scripts/deploy.sh
