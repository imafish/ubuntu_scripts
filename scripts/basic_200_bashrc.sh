#!/bin/bash

########################################################
# set up bashrc -- customized prompt

# show avatar
cp ../data/avatar_256color.txt ~/.avatar_256color.txt
cp ../data/avatar_8color.txt ~/.avatar_8color.txt

if grep -q '#ubuntu_scripts#' ~/.bashrc; then
  echo start up avatar already set.
else
  cat ../data/avatar.sh >> ~/.bashrc
fi

if [ -f ~/.bash_profile ] && grep -q '#ubuntu_scripts#' ~/.bash_profile; then
  echo already set for .bash_profile
else
  cat ../data/avatar.sh >> ~/.bash_profile
  cat ../data/color_prompt.sh >> ~/.bash_profile
fi

apt install -y fortune-mod

prompt_line=$(grep -n '^#force_color_prompt=yes' ~/.bashrc | grep -o '^[[:digit:]]*')
ps_line=`grep -n 'if \[ "$color_prompt" = yes \]; then' ~/.bashrc | grep -o '^[[:digit:]]*'`
if [ -n "$ps_line" ] && [ -n "$prompt_line" ]; then
  ps_line=$(expr $ps_line + 1)
  echo Found color prompt settings at line $ps_line and $prompt_line

  # make backup:
  ./helper_make_backup.sh ~/.bashrc

  sed -i 's/^#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc
  sed -i "$ps_line"c\\"    PS1='\\\\[\\\\e[32m.\\\\n.\\\\]\\\\e[0m "'${debian_chroot:+($debian_chroot)}'"\\\\u@\\\\h: \\\\w\\\\[\\\\e[33m\\\\]"'$(__git_ps1 2>/dev/null)'"\\\\n\\\\[\\\\e[35;1m\\\\]>\\\\[\\\\e[0m\\\\] '" ~/.bashrc

  exit
else
  echo "Can't find the line to modify in file .bashrc"
  echo "Not changing .bashrc"
  if [ -e $1 ]; then
    echo "Can't find the line to modify in file .bashrc" >> $1
    echo "Not changing .bashrc" >> $1
  fi
  exit 255
fi

