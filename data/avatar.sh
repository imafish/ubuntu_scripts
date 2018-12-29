
# show avatar
if [ "$PS1" ]; then
  if [ `tput colors` -gt 255 ]; then
    cat ~/.avatar_256color.txt
    echo
    echo
  else
    cat ~/.avatar_8color.txt
    echo
    echo
  fi

  fortune
  echo
fi
