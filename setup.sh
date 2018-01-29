# bash

DIR=$(pwd)

# git setup
git config --global user.name "Woojoong Kim"
git config --global user.email "woojoong.m.kim@gmail.com"

# ssh key setup
if [ ! -e ~/.ssh/id_rsa.pub ]
then
	ssh-keygen -t rsa
fi

# Setup passwordless environment
sudo vi /etc/sudoers

# update and upgrade
echo "Update and upgrade"
sleep 1
sudo apt-get update -y
sudo apt-get upgrade -y

# setup essential tools for C/C++/build/etc
sudo apt-get install wget tar libevent-dev libncurses-dev -y
sudo apt-get install build-esential gcc g++ gdb -y
# setup ssh server
sudo apt-get install openssh-server -y

# install htop tool
sudo apt-get install htop -y

# install vim
sudo apt-get install vim -y

# configuration of vim
rm -rf ~/.vim
rm -rf ~/.vimrc
cp .vimrc ~/.vimrc
if [ ! -e ~/.vim ]
then
	mkdir -p ~/.vim
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
# install tmux
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
	echo "Add tmux environment"
else
	echo ". $DIR/tmux_env" >> ~/.bashrc
	source ~/.bashrc
fi

# Manually setup according to Ubuntu 16.04
echo "GRUB_CMDLINE_LINUX=\"net.ifnames=0\" into /etc/default/grub"
echo "Then, run \$ sudo update-grub and reboot"
