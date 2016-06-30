#!/bin/sh

## For Virtual machines ##
## Add resolution config to Video settings ##

## USAGE ##
if test -z $2; then
  echo "Usage: custom_set_resolution.sh <resolution_x> <resolution_y>"
  exit 1
fi

screen=$(xrandr | grep "connected" | sed 's/ connected.*//')
#echo $screen

modeline=$(cvt $1 $2 | grep "Modeline" | sed "s/Modeline //")
#echo $modeline

modeline_name=$(echo $modeline | grep -o '".*"')
#echo $modeline_name

xrandr --newmode $modeline
xrandr --addmode $screen $modeline_name
xrandr --output $screen --mode $modeline_name
