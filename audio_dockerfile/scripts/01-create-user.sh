#!/bin/bash

# Create user
groupadd -g $GID $USER
useradd -m -s /bin/bash -u $UID -g $GID $USER

# Add jenkins to sudo group
apt-get update
apt-get -qq install sudo
usermod -aG sudo $USER

# Add user to sudoers without password
echo "${USER} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USER
chmod 0440 /etc/sudoers.d/$USER
