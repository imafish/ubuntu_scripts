#!/bin/bash

function usage() {
  echo "Usage $0 <go version>"
  exit 1
}

if [ "$1" = "" ]; then
  usage
fi

installer="/tmp/go_`date +%s`.tar.gz"
# download installer
echo download installer
wget -O ${installer} "https://dl.google.com/go/go$1.linux-amd64.tar.gz" || exit 2

echo extract to /usr/local
tar xf ${installer} -C /usr/local/ || exit 2

echo set PATH and GOPATH
# set path and gopath env
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/imafish/src/go

# test go version
echo test go version
go version || exit 2

# save to environment file so value is set on start up
echo save GOPATH to file
envfile=/etc/environment
if grep -qE "^GOPATH=" $envfile; then
  sed -i "s+^GOPATH=.*$+GOPATH=/home/imafish/src/go+" $envfile
else
  echo "GOPATH=/home/imafish/src/go" >> $envfile
fi

echo save PATH to file
if grep -qE "^PATH=" $envfile; then
  if grep -qE "^PATH=.*/usr/local/go/bin" $envfile; then
    # do not need to change anything
    echo "already in PATH"
  else
    sed -i '/^PATH=/ s+"$+:/usr/local/go/bin"+' $envfile
  fi
else
  echo 'PATH=$PATH:/usr/local/go/bin' >> $envfile
fi

echo done.
rm ${installer}

