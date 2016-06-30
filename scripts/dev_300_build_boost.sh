#!/bin/bash

#########################################################
# build boost
echo "building boost..."

boost_version=$(find ../data/ -name 'boost*.tar.bz2' | grep -o 'boost_[[:digit:]]_[[:digit:]]*_[[:digit:]]' | sort -r | head -1)
if [ -n "$boost_version" ]; then
  tar xjf ../data/$boost_version.tar.bz2 -C /tmp
  current_path=$(pwd)
  cd /tmp/$boost_version
  ./bootstrap.sh
  ./b2 install
  ldconfig
  cd $current_path
  exit 0
else
  echo "boost not found"
  exit 255
fi
