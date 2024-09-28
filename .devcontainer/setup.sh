#!/bin/bash
# setup.sh: Dev container setup script

# Update package lists and install necessary packages
sudo apt-get update && sudo apt-get install -y cmake gdb

# Configure Git to mark the directory as safe
git config --global --add safe.directory /workspaces/visualiser