#!/bin/bash

########################################################
# set up bashrc -- customized prompt

if [ -n "$SUDO_USER" ]; then
    REAL_HOME=/home/$SUDO_USER
else
    REAL_HOME=$HOME
fi

# copy data
cp -p ../data/avatar_256color.txt $REAL_HOME/.avatar_256color.txt
cp -p ../data/avatar_8color.txt $REAL_HOME/.avatar_8color.txt
cp -p ../data/my_bashrc.sh $REAL_HOME/.my_bashrc.sh
cp -p ../data/my_bash_profile.sh $REAL_HOME/.my_bash_profile.sh

BASHRC=$REAL_HOME/.bashrc
BASHPROFILE=$REAL_HOME/.bash_profile

PLACEHOLDER="#ubuntu_scripts#"

if grep -q "$PLACEHOLDER" $BASHRC; then
    echo ""
else
    echo "$PLACEHOLDER" >> $BASHRC
    echo '[ -f $HOME/.my_bashrc.sh ] && source $HOME/.my_bashrc.sh' >> $BASHRC
fi

# Let's create .bash_profile if it doesn't exist
if [ ! -e $BASHPROFILE ]; then
    ./helper_cp.sh ../data/bash_profile.sh $BASHPROFILE
else
    if grep -q "$PLACEHOLDER" $BASHPROFILE; then
        echo ""
    else
        echo "$PLACEHOLDER" >> $BASHPROFILE
        echo '[ -f $HOME/.my_bash_profile.sh ] && source $HOME/.my_bash_profile.sh' >> $BASHPROFILE
    fi
fi
