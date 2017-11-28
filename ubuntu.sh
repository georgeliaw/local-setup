#!/bin/bash

mkdir -p ~/Projects

# Set vars
CURRENT_DIR=${pwd}
BAZEL_VERSION=0.5.2

# Add PPAs
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:webupd8team/terminix
sudo add-apt-repository -y ppa:snwh/pulp
sudo apt-get update

# Install base packages
sudo apt-get install -y pkg-config zip g++ zlib1g-dev unzip
sudo apt-get install -y gir1.2-gtop-2.0 gir1.2-networkmanager-1.0 gir1.2-clutter-1.0

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
wget https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
chmod +x bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
./bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh --user
wget https://raw.githubusercontent.com/bazelbuild/bazel/master/scripts/bazel-complete-template.bash

git clone git@github.com:bazelbuild/bazel.git ~/Projects/bazel
cd ~/Projects/bazel
bazel build //scripts:bash_completion
cp bazel-bin/scripts/bazel-complete.bash ~/.bazel/bin/
cd ${CURRENT_DIR}

# Install Silver Searcher
apt-get install -y silversearcher-ag

# Install Fuzzy Finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Update bashrc
echo "export PATH=\"$PATH:$HOME/bin\"" >> ~/.bashrc
echo "source ~/.bazel/bin/bazel-complete.bash" >> ~/.bashrc
echo "[ -f ~/.fzf.bash ] && source ~/.fzf.bash" >> ~/.bashrc
