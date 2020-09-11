#!/bin/bash

########################################################
# set up bashrc -- customized prompt

# show avatar
cp ../data/avatar_256color.txt $HOME/.avatar_256color.txt
cp ../data/avatar_8color.txt $HOME/.avatar_8color.txt

BASHRC=$HOME/.bashrc
BASHPROFILE=$HOME/.bash_profile

if grep -q '#ubuntu_scripts#' $BASHRC; then
  echo start up avatar already set.
else
  cat ../data/avatar.sh >> $BASHRC
fi

if [ -f $BASHPROFILE ] && grep -q '#ubuntu_scripts#' $HOME/.bash_profile; then
  echo already set for .bash_profile
else
  cat ../data/avatar.sh >> $BASHPROFILE
  cat ../data/color_prompt.sh >> $BASHPROFILE
fi

prompt_line=$(grep -n '^#force_color_prompt=yes' $BASHRC | grep -o '^[[:digit:]]*')
ps_line=`grep -n 'if \[ "$color_prompt" = yes \]; then' $BASHRC | grep -o '^[[:digit:]]*'`
if [ -n "$ps_line" ] && [ -n "$prompt_line" ]; then
  ps_line=$(expr $ps_line + 1)
  echo Found color prompt settings at line $ps_line and $prompt_line

  # make backup:
  ./helper_make_backup.sh $BASHRC

  sed -i 's/^#force_color_prompt=yes/force_color_prompt=yes/' $BASHRC
  sed -i "$ps_line"c\\"    PS1='\\\\[\\\\e[36m.\\\\n.\\\\]\\\\e[0m "'${debian_chroot:+($debian_chroot)}'"\\\\u@\\\\h: \\\\w\\\\[\\\\e[33m\\\\]"'$(__git_ps1 2>/dev/null)'"\\\\n\\\\[\\\\e[31;1m\\\\]>\\\\[\\\\e[0m\\\\] '" ~/.bashrc

  exit
else
  echo "Can't find the line to modify in file .bashrc"
  echo "Not changing .bashrc"
  if [ -e "$1" ]; then
    echo "Can't find the line to modify in file .bashrc" >> $1
    echo "Not changing .bashrc" >> $1
  fi
  exit 255
fi

