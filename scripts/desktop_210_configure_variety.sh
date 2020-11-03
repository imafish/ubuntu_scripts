#!/bin/bash

########################################################
# set up terminal command
# works for Gnome Terminal 3.6.2

if [ -z "$SUDO_USER" ]; then
  echo "must run as sudo"
  exit 255
fi

REAL_HOME=/home/$SUDO_USER
source_file=../data/variety.conf
target_dir=$REAL_HOME/.config/variety
target_file=$target_dir/variety.conf

if [ ! -d $target_dir ]; then
  mkdir -p $target_dir
  chown -R $SUDO_USER:$SUDO_USER $REAL_HOME/.config
fi

cp -p $source_file $target_file

