#!/bin/bash

mkdir -p ~/Projects


# Set vars
BAZEL_VERSION=0.5.2

# Add PPAs
sudo apt-add-repository -y ppa:ansible/ansible
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:webupd8team/terminix
sudo add-apt-repository -y ppa:snwh/pulp
sudo apt-get update

# Install base packages
sudo apt-get install -y pkg-config zip g++ zlib1g-dev unzip
sudo apt-get install -y gir1.2-gtop-2.0 gir1.2-networkmanager-1.0 gir1.2-clutter-1.0

# Install pip
cd ~/Downloads
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

# Install ansible
pip install ansible --user

# Install Java 8
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java8-installer

# Install Gnome3 Desktop
sudo apt-get install -y gnome-shell

# Install Tilix
sudo apt-get install -y tilix

# Install Paper themes
sudo apt-get install -y paper-icon-theme
sudo apt-get install -y paper-cursor-theme
sudo apt-get install -y paper-gtk-theme

# Install Bazel
cd ~/Downloads
wget https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
chmod +x bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
./bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh --user
sudo cp ~/.bazel/bin/bazel-complete.bash /etc/bash_completion.d/

# Install PyCharm
wget 'https://download.jetbrains.com/python/pycharm-community-2017.2.4.tar.gz'
tar xvzf pycharm-community-2017.2.4.tar.gz -C ~

# Install Silver Searcher
sudo apt-get install -y silversearcher-ag

# Install Fuzzy Finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Update bashrc
echo 'export EDITOR=nano' >> ~/.bashrc
echo 'export PATH="$PATH:$HOME/bin:$HOME/.local/bin"' >> ~/.bashrc

# Update nanorc
echo 'set tabsize 4' >> ~/.nanorc
echo 'set tabstospaces' >> ~/.nanorc

source ~/.bashrc
