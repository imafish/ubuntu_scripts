#!/bin/bash

if [ -f $1 ]; then
    cp -p $1 $2
    if [ -z $SUDO_USER ]; then
	chown $SUDO_USER:$SUDO_USER $2
    fi
    exit
fi
