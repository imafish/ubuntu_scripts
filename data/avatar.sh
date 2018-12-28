
# show avatar
if [ `tput colors` -lt 9 ]; then
  echo 'TODO placeholder -- ASCII art for 8 color console'
else
  cat ~/.block.txt
  echo
  echo
fi

