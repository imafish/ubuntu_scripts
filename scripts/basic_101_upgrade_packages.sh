#!/bin/bash

#########################################################
# install basic software
echo upgrade packages to latest

apt upgrade -y
apt autoremove -y
