#!/bin/bash

if [ -s $SUDO_USER ]; then
  echo "please run this script using sudo"
  exit 1
fi

if [ -f "$1" ]; then
  tmpfile=$1
else
  tmpfile=/tmp/`date +%s`.tmp
fi

# run all script under scripts/basic_*.sh
cd scripts
for script in ./desktop_*.sh
do
  echo
  echo
  echo "-----------------------------------------"
  echo "running $script ..."
  $script $1
  exit_code=$?
  result="$script exited with code $exit_code"
  echo $result
  echo $result >> "${tmpfile}"
done

if [ "$1" = "" ]; then
  cat "${tmpfile}"
  rm "${tmpfile}"
fi

cd ..
