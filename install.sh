#!/usr/bin/env bash

# Install all necessary packages
apt update
apt install -y stow git git-lfs zsh curl wget tmux

# Set up symlinks using stow
for d in `ls -d */`;
do
    ( stow --restow $d )
done

# Update settings
source ~/.zshrc
