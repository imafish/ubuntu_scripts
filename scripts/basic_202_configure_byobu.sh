#!/bin/bash

echo do not use byobu promt which is configured in .bashrc

if grep -qE '^[^#].*#byobu-prompt#' ~/.bashrc; then
  sed -i '/#byobu-prompt#/ s/^/#/' ~/.bashrc
  echo comment the byobu line in .bashrc
else
  echo already commented out.
fi

byobu-quiet

echo done.

