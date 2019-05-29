#!/bin/bash

## set default run level ##

function usage() {
  echo "$0 3|5    --- 3 for text mode, 5 for graphic mode"
  exit 1
}

if [ "$1" == '5' ];then
  systemctl set-default graphical.target
elif [ "$1" == '5' ];then
  systemctl set-default multi-user.target
else
  usage
  exit 1
fi


