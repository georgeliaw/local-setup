#!/bin/bash
set -ex
REPO_DIR=$PWD

# Install Python3.7
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get update
sudo apt-get install python2.7 python3.7 -y
sudo apt-get install python3-distutils -y

# Update bashrc
if [[ -z $(grep '^export PATH="$PATH:$HOME/.local/bin"$' ~/.bashrc) ]]; then
    echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
fi

# Install Pip
if [[ ! -f /usr/local/bin/pip3 ]]; then
    cd ~/Downloads
    if [[ ! -f ~/Downloads/get-pip.py ]]; then
        wget https://bootstrap.pypa.io/get-pip.py
    fi
    python3 get-pip.py --user
    cd $REPO_DIR
fi

# Install ansible
if [[ ! -f ~/.local/bin/ansible ]]; then
    ~/.local/bin/pip3 install ansible --user
    export PATH="$PATH:$HOME/.local/bin"
fi

# Run playbook
~/.local/bin/ansible-playbook setup.yml --ask-become-pass

source ~/.bashrc
