#!/bin/bash

function usage() {
    echo "$0 <filename>"
    exit 1
}

if [ $# -lt 1 ]; then
    usage
fi

# 7MB
SIZE_LIMIT=7340032

FILESIZE=$(stat -c%s "$1")
if [ $FILESIZE -gt $SIZE_LIMIT ]; then
    >&2 echo "size of file \"$1\" exceeds maxmium ($FILESIZE > $SIZE_LIMIT)"
    exit 1
fi

if [ $FILESIZE -gt 524288 ]; then
    >&2 echo "warning: size of file \"$1\" is large ($FILESIZE), please wait.."
else
    >&2 echo "please wait while file is being processed for colorization"
fi

CAN_COLORIZE=`pygmentize -N $1`

if [ "$CAN_COLORIZE" != "text" ]; then
    pygmentize -f 256 -O style=friendly "$1"
else
    pygmentize -f 256 -O style=friendly -g "$1"
fi

