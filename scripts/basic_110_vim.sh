#!/bin/bash

########################################################
# set up VIM
vimrc_path='../data/vimrc.txt'

if [ ! -z $SUDO_USER ]; then
    HOME=/home/$SUDO_USER
fi

mkdir -p $HOME/.tmp/vimswap
mkdir -p $HOME/.tmp/vimbackup
mkdir -p $HOME/.tmp/vimundo

target_file=$HOME/.vimrc
if [ -f $vimrc_path ]; then
  ./helper_make_backup.sh ${target_file}
  ./helper_cp.sh $vimrc_path ${target_file}
  exit
else
  echo "ERROR: file $vimrc_path not found"
  exit 255
fi

# invoke vim to install plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

