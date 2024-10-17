#!/usr/bin/env bash

# Install all necessary packages
apt update
apt install -y stow git git-lfs zsh curl wget tmux

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
