FROM ubuntu:latest

# apt install

RUN apt-get update && apt-get install -y \
    sudo curl git zsh vim

# add user

ARG USERNAME=dockeruser
ARG GROUPNAME=dockergroup
ARG UID=1000
ARG GID=1000
ARG PASSWORD=password
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USERNAME
WORKDIR /home/$USERNAME/

# sheldon

RUN curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- --repo rossmacarthur/sheldon --to $HOME/.local/bin

ENV PATH $PATH:$HOME.local/bin

RUN echo 'y' | sheldon init --shell zsh

# starship

RUN curl -o starship.sh https://starship.rs/install.sh

RUN  sudo sh starship.sh -f

RUN rm starship.sh

# dotfiles

RUN git clone https://github.com/Nameless-itf23/dotfiles.git

RUN ./dotfiles/scripts/deploy.sh

RUN sudo chsh -s /bin/zsh
