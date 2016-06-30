#!/bin/bash

#########################################################
# install dev software
echo "calling apt-get to install a few packages..."

packages="../data/packages.txt"
if [ -f $packages ]; then
  echo "getting package list from packages.txt..."
  cat $packages
  apt-get -y install $(cat $packages)
  exit
else
  echo "software list file $packages not found"
  exit 255
fi
