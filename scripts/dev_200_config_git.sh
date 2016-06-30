#!/bin/bash

#########################################################
# set up git
git config --global user.name imafish.Guo
git config --global user.email imafish.i+git@gmail.com
git config --global ui.color auto
git config --global core.editor "vim"
git config --global push.default simple

gitignore="../data/gitignore.txt"
target=~/.gitignore
if [ -f $gitignore ]; then
  ./helper_make_backup.sh ${target}
  cp $gitignore ${target}
  git config --global core.excludesfile ${target}
  exit
else
  echo "data file ${gitignore} not found"
  exit 255
fi
