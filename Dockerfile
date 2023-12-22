FROM ubuntu:latest

# apt install

RUN apt update && apt install -y \
    sudo curl build-essential git zsh vim 

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

# brew

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && sudo chmod -R 777 /home/linuxbrew

ARG brew=/home/linuxbrew/.linuxbrew/bin/brew

# sheldon

RUN $brew install sheldon

# # starship

RUN $brew install starship

# dotfiles

RUN git clone https://github.com/Nameless-itf23/dotfiles.git

RUN ./dotfiles/scripts/deploy.sh

RUN sudo chsh -s /bin/zsh
