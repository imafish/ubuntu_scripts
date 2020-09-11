#!/bin/bash

########################################################
# set up VIM
vimrc_path='../data/vimrc.txt'

if [ ! -z $SUDO_USER ]; then
    HOME=/home/$SUDO_USER
fi

target_file=$HOME/.vimrc
if [ -f $vimrc_path ]; then
  ./helper_make_backup.sh ${target_file}
  ./helper_cp.sh $vimrc_path ${target_file}
  exit
else
  echo "ERROR: file $vimrc_path not found"
  exit 255
fi
