#!/bin/bash

## For Virtual machines ##
## Add resolution config to Video settings ##

change () {
  grep 'net.ipv6.conf.all.disable_ipv6' /etc/sysctl.conf
  if [ $? -eq 0 ];then
    sed -i "s/net\\.ipv6\\.conf\\.all\\.disable_ipv6.*/net.ipv6.conf.all.disable_ipv6=$1/g" /etc/sysctl.conf
  elif [ $? -eq 1 ]; then
    echo "net.ipv6.conf.all.disable_ipv6=$1" >> /etc/sysctl.conf
  fi

  grep 'net.ipv6.conf.default.disable_ipv6' /etc/sysctl.conf
  if [ $? -eq 0 ];then
    sed -i "s/net\\.ipv6\\.conf\\.default\\.disable_ipv6.*/net.ipv6.conf.default.disable_ipv6=$1/g" /etc/sysctl.conf
  elif [ $? -eq 1 ]; then
    echo "net.ipv6.conf.default.disable_ipv6=$1" >> /etc/sysctl.conf
  fi

  sysctl -p
}

if [ "$1" == 'enable' ];then
  echo "enabling ipv6"
  change "0"
elif [ "$1" == 'disable' ];then
  echo "disabling ipv6"
  change "1"
else
  echo "Usage: custom_ipv6.sh enable|disable"
  exit 1
fi


