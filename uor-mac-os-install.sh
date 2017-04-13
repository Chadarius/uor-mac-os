#!/bin/bash
###########################################################################
# uor-mac-os-install.sh will install the Ultima Online: Renaissance Mac OS 
# version 1.0
# Copyright (C) 2017 Chad Sutton <casutton@noctrl.edu>
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the 
# Free Software Foundation, either version 3 of the License, or (at your 
# option) any later version.
# This program is distributed in the hope that it will be useful, but 
# WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
# See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along 
# with this program. If not, see http://www.gnu.org/licenses/.
###########################################################################

uordmgurl="http://www.uorenaissance.com/downloads/UO%20Renaissance.dmg"
uordmg="UO Renaissance.dmg"
uorloc="/Applications"

# Check if UO Renaissance is already installed
if [ -d "${uorloc}/UO Renaissance.app" ]
	then
	echo 
	echo
	echo "You already have UO Renaissance install in $uorloc"
	echo "Please save any data from your install and remove it before running the installer"
	echo
	echo 
	exit 1
fi

# pre-clean up
if [ -e "/tmp/${uordmg}" ]
	then
	rm "/tmp/${uordmg}" 
fi
# Download UOR DMG
curl -L -o "/tmp/${uordmg}" "${uordmgurl}"

# Mount UOR DMG
hdiutil attach -nobrowse -quiet -mountpoint /Volumes/uor "/tmp/${uordmg}"
# Copy .App to Applications Folder
cp -a /Volumes/uor/UO\ Renaissance.app /Applications/

# Unmount DMG
hdiutil detach -quiet /Volumes/uor

# Cleanup DMG from /tmp
if [ -e "/tmp/${uordmg}" ]
	then
	rm "/tmp/${uordmg}" 
fi


