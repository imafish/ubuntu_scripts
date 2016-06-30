#!/bin/bash

if [ -f $1 ]; then
  echo backing up for file ${1}
  cp -p $1 "$1.$(date +%y%m%d_%T).backup"
  exit
fi
