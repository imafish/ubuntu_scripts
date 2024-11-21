# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

[ -f $HOME/.bashrc ] && source $HOME/.bashrc


# create commonly used folders
[ -d "$HOME/.tmp" ] || mkdir $HOME/.tmp
[ -d "$HOME/.tmp/vimundo" ] || mkdir $HOME/.tmp/vimundo
[ -d "$HOME/.tmp/vimswap" ] || mkdir $HOME/.tmp/vimswap
[ -d "$HOME/.tmp/vimbackup" ] || mkdir $HOME/.tmp/vimbackup
[ -d "$HOME/src" ] || mkdir $HOME/src
[ -d "$HOME/bin" ] || mkdir $HOME/bin
[ -d "$HOME/tmp" ] || mkdir $HOME/tmp

