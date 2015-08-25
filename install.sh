#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

################################################
# packages
################################################
echo "Install packages"
sudo aptitude install vim tmux git i3 zsh feh xautolock

################################################
# vim
################################################
echo "Installing vim config"
ln -sf $DIR/vimrc ~/.vimrc

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  echo "Installing vundle"
  mkdir -p ~/.vim/bundle
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  echo "Vundle already installed"
fi

################################################
# tmux
################################################
echo "Installing tmux config"
ln -sf $DIR/tmux.conf ~/.tmux.conf
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "TPM already installed"
fi

################################################
# zsh
################################################
echo "Installing zsh config"
ln -sf $DIR/zshrc ~/.zshrc
ln -sf $DIR/zshrc.local ~/.zshrc.local


################################################
# git
################################################
echo "Installing git config"
ln -sf $DIR/gitconfig ~/.gitconfig


################################################
# i3
################################################
echo "Installing i3 config"
mkdir -p ~/.i3
ln -sf $DIR/i3/config ~/.i3/config
ln -sf $DIR/i3/lock.sh ~/.i3/lock.sh
ln -sf $DIR/i3/wallpaper.png ~/.i3/wallpaper.png
ln -sf $DIR/i3/i3status.conf ~/.i3/i3status.conf
