#!/bin/bash

########################################################
# set up terminal command
# works for Gnome Terminal 3.6.2

source_file=../data/variety.conf
target_dir=$HOME/.config/variety
target_file=$target_dir/variety.conf

if [ -z "$SUDO_USER" ]; then
  echo "must run as sudo"
  exit 255
fi

if [ ! -d $target_dir ]; then
  mkdir -p $target_dir
  chown -R $SUDO_USER:$SUDO_USER $HOME/.config
fi

cp $source_file $target_file
chown -R $SUDO_USER:$SUDO_USER $HOME/.config
