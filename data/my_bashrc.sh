#!/bin/bash

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
    PS1='\[\e[36m🏁\n.\]\e[0m\e[2m ${debian_chroot:+($debian_chroot)}\u:\e[0m \w\[\e[33m\]$(__git_ps1 2>/dev/null)\n\[\e[31;1m\]>\[\e[0m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


# show avatar #ubuntu_scripts# 
if [ `tput colors` -gt 255 ]; then 
    cat ~/.avatar_256color.txt 
    echo 
else 
    cat ~/.avatar_8color.txt 
    echo 
fi 

fortune 
echo 

export LESS=-R 
export -n LESSCLOSE 
export LESSOPEN="| ~/bin/lessfilter.sh %s" 
alias lessno="less --no-lessopen" 

