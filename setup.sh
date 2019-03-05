#!/bin/bash
#
# Copyright 2019-present an Individual Developer Woojoong Kim 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DIR=$(pwd)

# SSH key setup
if [ ! -e ~/.ssh/id_rsa.pub ]
then
    ssh-keygen -t rsa
fi

# Setup .exrc
echo "set number" > ~/.exrc
echo "set nocp" >> ~/.exrc
echo "set bs=2" >> ~/.exrc
echo "set ts=4" >> ~/.exrc
echo "set expandtab" >> ~/.exrc
echo "set shiftwidth=4" >> ~/.exrc

# Setup passwordless environment
sudo vi /etc/sudoers

# Ubuntu Update
sudo apt update -y

# git setup
git config --global user.name "Woojoong Kim"
git config --global user.email "woojoong.m.kim@gmail.com"

# Install essential tools for C/C++/build/etc
sudo apt install wget tar libevent-dev libncurses-dev -y
sudo apt install build-essential gcc g++ gdb -y
sudo apt install ctags -y
sudo apt install cscope -y
sudo apt install python-pip python-dev -y
sudo pip-install --upgrade pip
sudo pip-install --upgrade virtualenv

# Install SSH server
sudo apt install openssh-server

# Install htop
sudo apt install htop

# Install vim
sudo apt install vim

# Configure vim
rm -rf ~/.vim
rm -rf ~/.vimrc
cp $DIR/.vimrc ~/.vimrc
if [ ! -e ~/.vim ]
then
    mkdir -p ~/.vim
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install tmux
VERSION=2.6 && mkdir tmux-src && wget -qO- https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz | tar xvz -C $DIR/tmux-src
cd $DIR/tmux-src/tmux-2.6 && ./configure && make clean && make && sudo sh -c "make install"
cd $DIR && rm -rf tmux-src

if [ "$1" = "main" ]
then
    git clone https://github.com/woojoong88/tmux-config tmux-config
    rm -rf ./tmux-config/tmux.conf
    rm -rf .tmux-config/tmux.remote.conf
    cp tmux.conf ./tmux-conf
    cp tmux.remote.conf ./tmux.remote.conf
    ./tmux-config/install.sh
else
    rm -rf ~/.tmux
    rm -rf ~/.tmux.conf
    echo "set -g pane-active-border-bg green" > ~/.tmux.conf
    echo "set -g pane-active-border-fg green" >> ~/.tmux.conf
fi

# tmux env setup
IS_SET=$(grep -r "tmux_env" ~/.bashrc | wc -l)
if [ $IS_SET != "0" ]
then
    echo "Already have tmux environment"
else
    echo ". $DIR/tmux_env" >> ~/.bashrc
    source ~/.bashrc
fi

