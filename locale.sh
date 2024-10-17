#!/usr/bin/env bash

# Install all necessary packages
apt update
apt install -y locales

# Uncomment the en_US.UTF-8 locale in /etc/locale.gen
sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen

# Generate the locales
locale-gen

# Set the default locale
update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

# Reconfigure locales
dpkg-reconfigure --frontend=noninteractive locales
