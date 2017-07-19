#!/bin/bash

# Set vars
BAZEL_VERSION=0.5.2

# Add PPAs
sudo add-apt-repository ppa:webupd8team/java
sudo add-apt-repository ppa:webupd8team/terminix
sudo apt-get update

# Install base packages
sudo apt-get install pkg-config zip g++ zlib1g-dev unzip

# Install Java 8
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install oracle-java8-installer

# Install Gnome3 Desktop
sudo apt-get install gnome-shell

# Install Tilix
sudo apt-get install tilix

# Install Bazel
wget https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
chmod +x bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
./bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh --user

# Update bashrc
echo "export PATH=\"$PATH:$HOME/bin\"" >> ~/.bashrc
