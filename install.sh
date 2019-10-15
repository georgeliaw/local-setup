#!/bin/bash
set -ex
REPO_DIR=$PWD

# Install Python3.7
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get update
sudo apt-get install python2.7 python3.7 -y

# Install Pip
if [[ ! -f /usr/local/bin/pip ]]; then
    cd ~/Downloads
    wget https://bootstrap.pypa.io/get-pip.py
    sudo python get-pip.py
    cd $REPO_DIR
fi

# Install ansible
if [[ ! -f ~/.local/bin/ansible ]]; then
    pip install ansible --user
    export PATH="$PATH:$HOME/.local/bin"
fi

# Update bashrc
if [[ -z $(grep '^export PATH="$PATH:$HOME/.local/bin"$' ~/.bashrc) ]]; then
    echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
fi

# Run playbook
~/.local/bin/ansible-playbook setup.yml --ask-become-pass

source ~/.bashrc
