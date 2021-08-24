#!/bin/bash

# Ensure apt is up to date with all updates
apt update -y

# Upgrade all installed packages
apt upgrade -y

# Install new packages, uninstall any old packages that
# must be removed to install them
apt full-upgrade -y

# Remove unused packages and their associated configuration files
apt autoremove --purge -y

# Perform with a single line of code.
apt update -y && apt upgrade -y && apt full-upgrade -y && apt-get autoremove --purge -y

