#!/usr/bin/env bash

# Set locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Install all necessary packages
apt update
apt install -y stow git git-lfs zsh curl wget tmux

# Generate the en_US.UTF-8 locale
locale-gen en_US.UTF-8

# Reconfigure locales
dpkg-reconfigure --frontend=noninteractive locales

# Install oh-my-zsh
rm -rf ~/.oh-my-zsh
rm -rf ~/.zshrc
echo "y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -rf ~/.zshrc

# Set up symlinks using stow
for d in `ls -d */`;
do
    ( stow --restow $d -t ~/)
done

# Update settings
source ~/.zshrc
