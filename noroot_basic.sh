#!/bin/bash

if [ -f "$1" ]; then
  tmpfile=$1
else
  tmpfile=/tmp/`date +%s`.tmp
fi

# run all script under scripts/basic_*.sh
cd scripts
for script in ./noroot_basic_*.sh
do
  echo
  echo
  echo "-----------------------------------------"
  if [ -z $SUDO_USER ]; then
    echo "running $script ..."
    $script $1
  else
    echo "running $script as $SUDO_USER"
    su $SUDO_USER -c "$script $1"
  fi
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
