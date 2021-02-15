#!/bin/bash

# README #

# DESCRIPTION:
# FIXES JITTERY MOVEMENT IN TMODLOADER BY UPDATING LIBSDL2 WITHIN THE TMODLOADER DIRECTORY.

rootcheck () { # Checks if sudo is active so all commands can work properly
    if [ $(id -u) != "0" ]
    then
        sudo "$0" "$@"
        exit $?
    fi
}

user=$(whoami)

sudo apt update # Makes sure all repositories are updated
sudo apt install libsdl2-dev # Installs the most up-to-date version of libSDL2

cp /usr/lib/x86_64-linux-gnu/libSDL2-2.0.so* /home/$user/.steam/steam/steamapps/common/tModLoader/lib # Copies new files into the directory
cp /usr/lib/x86_64-linux-gnu/libSDL2-2.0.so* /home/$user/.steam/steam/steamapps/common/tModLoader/lib64 # Copies new files into the directory
rm /home/$user/.steam/steam/steamapps/common/tModLoader/lib/libSDL2-2.0.so.0 /home/$user/.steam/steam/steamapps/common/tModLoader/lib64/libSDL2-2.0.so.0 # Removes obsolete version of libSDL2

echo Done!
