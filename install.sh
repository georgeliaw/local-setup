#!/bin/bash
set -ex

# Install Pip
if [[ ! -f /usr/local/bin/pip ]]; then
    cd ~/Downloads
    wget https://bootstrap.pypa.io/get-pip.py
    sudo python get-pip.py
fi

# Install ansible
if [[ ! -f ~/.local/bin/ansible ]]; then
    pip install ansible --user
    echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
fi

# Update bashrc
if [[ -z $(grep '^export PATH="$PATH:$HOME/.local/bin"$' ~/.bashrc) ]]; then
    echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
fi

# Run playbook
ansible-playbook setup.yml --ask-become-pass

source ~/.bashrc
