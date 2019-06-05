#!/bin/bash

## set default run level ##

function usage() {
  echo "Usage: $0 <font-files>"
  exit 1
}

FONT_DIR=/usr/share/fonts/imafish

if [ "$#" -lt 1 ]; then
  usage
fi

for i; do
  if [ ! -s $i ]; then
    echo unable to find file $i
  fi
done

if [ ! -d $FONT_DIR ]; then
  echo "making directory $FONT_DIR"
  mkdir $FONT_DIR
fi

cp "$@" $FONT_DIR
chown root:root $FONT_DIR/*
chmod 644 $FONT_DIR/*
fc-cache -f -v
