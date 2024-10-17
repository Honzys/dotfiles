#!/usr/bin/env bash

# Install all necessary packages
apt update
apt install -y stow git git-lfs zsh curl wget tmux locales

# Uncomment the en_US.UTF-8 locale in /etc/locale.gen
sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen

# Generate the locales
locale-gen

# Set the default locale
update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

# Set locale environment variables
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Reconfigure locales
dpkg-reconfigure --frontend=noninteractive locales

# Install oh-my-zsh
chsh -s $(which zsh)
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
