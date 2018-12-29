
# show avatar
if [ "$PS1" ]; then
  if [ `tput colors` -gt 255 ]; then
    cat ~/.block.txt
    echo
    echo
  else
    echo 'TODO placeholder -- ASCII art for 8 color console'
  fi

  fortune
  echo
fi
