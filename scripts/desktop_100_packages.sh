#!/bin/bash

#########################################################
# install basic software
echo "calling apt to install a few packages..."

packages="../data/desktop_packages.txt"
if [ -f $packages ]; then
  echo "getting package list from $packages..."
  cat $packages
  apt -y install $(cat $packages)
  exit
else
  echo "software list file $packages not found"
  exit 255
fi
