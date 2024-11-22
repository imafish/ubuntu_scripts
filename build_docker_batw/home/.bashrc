#!/bin/bash

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\e[32m\n🐳\n.\]\e[0m\e[2m ${debian_chroot:+($debian_chroot)}\u:\e[0m \w\[\e[33m\]$(__git_ps1 2>/dev/null)\n\[\e[35;1m\]>\[\e[0m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt



# show avatar #ubuntu_scripts#
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

  /usr/games/fortune 2>/dev/null
  echo
fi

# easy access for python3
alias p3=python3

# other aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias less='less -r'
alias ct='cd ~/tmp'
alias cs='cd ~/src'

# FOR GO
export PATH=$PATH:/usr/local/go/bin/:/home/imafish/go/bin/

# FOR BATW/BMW related
export DOCKERREPO=common.artifactory.cc.bmwgroup.net/external-docker-io

# prompt user to change their password
./.first_time.sh

# BA proxy
export BAPROXY=http://10.114.26.34:3128
export BASOCKS5=socks5://10.114.26.34:1080
alias proxy="http_proxy=$BAPROXY https_proxy=$BAPROXY all_proxy=$BASOCKS5"
alias proxyup="export ALL_PROXY=$BASOCKS5 && export all_proxy=$BASOCKS5 && export HTTP_PROXY=$BAPROXY && export http_proxy=$BAPROXY && export https_proxy=$BAPROXY && export HTTPS_PROXY=$BAPROXY"
alias proxydown="unset ALL_PROXY && unset HTTP_PROXY && unset HTTPS_PROXY && unset all_proxy && unset http_proxy && unset https_proxy"

# add HOME/bin to PATH
export PATH=$PATH:$HOME/bin

# alias for bazel
alias bazel=bazelisk
