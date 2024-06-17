FROM ubuntu:latest

# apt install

RUN apt update && apt install -y sudo git

# add user

ARG USERNAME=dockeruser
ARG GROUPNAME=dockergroup
ARG UID=1001
ARG GID=1001
ARG PASSWORD=password
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USERNAME
WORKDIR /home/$USERNAME/

# dotfiles

RUN git clone https://github.com/Nameless-itf23/dotfiles.git

RUN chmod -R 775 dotfiles

RUN ./dotfiles/scripts/install.sh
