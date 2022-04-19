
#
# FROM ~/.profile (as this file won't be executed if .bash_profile exists)
#
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022


# a hint to show that login script is executed
echo "running login script .bash_profile"

#ubuntu_scripts#
[ -f $HOME/.my_bash_profile.sh ] && source $HOME/.my_bash_profile.sh
