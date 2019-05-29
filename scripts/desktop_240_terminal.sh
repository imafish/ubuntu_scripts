#!/bin/bash

########################################################
# set up terminal command
# works for Gnome Terminal 3.6.2

source_file=../data/%gconf.xml
target_file=~/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml
if [ -f ${source_file} ]; then
  # making backup:
  ./helper_make_backup.sh ${target_file}

  cp -p ${source_file} ${target_file}
  exit
else
  echo "File ${source_file} Not found"
  exit 255
fi
