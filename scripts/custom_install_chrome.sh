#!/bin/bash

installer="/tmp/chrome_installer_`date +%s`.deb"
wget -O ${installer} https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i ${installer}
rm ${installer}

