#!/bin/bash

########################################################
# set up aliases for bash

source_file=../data/.bash_aliases
target_file=~/.bash_aliases
if [ -f ${source_file} ]; then
  # backup
  ./helper_make_backup.sh ${target_file}

  cp -p ${source_file} ${target_file}
  exit
else
  echo "file ${source_file} not found"
  exit 255
fi
