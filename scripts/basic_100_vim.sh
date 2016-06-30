#!/bin/bash

########################################################
# set up VIM
apt-get -y install vim vim-gnome

vimrc_path='../data/vimrc.txt'
target_file=~/.vimrc
if [ -f $vimrc_path ]; then
  ./helper_make_backup.sh ${target_file}
  cp -p $vimrc_path ${target_file}
  exit
else
  echo "ERROR: file $vimrc_path not found"
  exit 255
fi
