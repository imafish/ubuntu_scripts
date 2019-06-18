#!/bin/bash

########################################################
# set up terminal command
# works for Gnome Terminal 3.6.2

source_file=../data/variety.conf
target_dir=~/.config/variety
target_file=$target_dir/variety.conf

if [ ! -d $target_dir ]; then
  mkdir -p $target_dir
  chown -R $USER:$USER ~/.config
fi

cp $source_file $target_file
chown $USER:$USER $target_file
