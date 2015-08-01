#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

################################################
# packages
################################################
echo "Install packages"
sudo aptitude install vim tmux git i3 zsh

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

################################################
# zsh
################################################
echo "Installing zsh config"
ln -sf $DIR/zshrc ~/.zshrc

if [ ! -n "$ZSH" ]; then
  ZSH=~/.oh-my-zsh
fi

if [ -d "$ZSH" ]; then
  echo "You already have Oh My Zsh installed. You'll need to remove $ZSH if you want to install"
else
  echo "\033[0;34mCloning Oh My Zsh...\033[0m"
  hash git >/dev/null 2>&1 && env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH || {
    echo "git not installed"
  }
fi


################################################
# git
################################################
echo "Installing git config"
ln -sf $DIR/gitconfig ~/.gitconfig


################################################
# i3
################################################
echo "Installing i3 config"
ln -sf $DIR/i3/config ~/.i3/config
ln -sf $DIR/i3/lock.sh ~/.i3/lock.sh
ln -sf $DIR/i3/wallpaper.png ~/.i3/wallpaper.png
ln -sf $DIR/i3/i3status.conf ~/.i3/i3status.conf
