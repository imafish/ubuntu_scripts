#!/bin/bash

########################################################
# setup less -- use pygments to colorize output


if [ -n "$SUDO_USER" ]; then
    REAL_HOME=/home/$SUDO_USER
else
    REAL_HOME=$HOME
fi


if [ ! -d $REAL_HOME/bin ]; then
    mkdir $REAL_HOME/bin
    if [ $SUDO_USER ]; then
        chown $SUDO_USER:$SUDO_USER $REAL_HOME/bin
    fi
fi

./helper_cp.sh ../data/lessfilter.sh $REAL_HOME/bin/lessfilter.sh


echo "" >> $REAL_HOME/.bash_profile
echo "export LESS=-R" >> $REAL_HOME/.bash_profile
echo "export -n LESSCLOSE" >> $REAL_HOME/.bash_profile
echo "export LESSOPEN=\"\| ~/bin/lessfilter.sh %s\"" >> $REAL_HOME/.bash_profile

