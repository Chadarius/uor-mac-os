#!/bin/bash
###########################################################################
# uoam.sh will start UOAM verison 8.3 if it is installed. 
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


# Set paths to stuff
uostorage="$(dirname "$0")"
CONTENTSFOLD="/Applications/UO Renaissance.app/Contents"
WINEPREFIX="$CONTENTSFOLD/Resources"
export PATH="$CONTENTSFOLD/Frameworks/bin:$CONTENTSFOLD/Frameworks/wswine.bundle/bin:$PATH"
export WINEPREFIX="$CONTENTSFOLD/Resources"
uorazorlocal="$WINEPREFIX/drive_c/Program Files/Razor"
uoamlocal="$uostorage/UOAM"
uolocaldir="$WINEPREFIX/drive_c/Ultima Online"

echo uostorage is $uostorage
echo contents folder is $CONTENTSFOLD

# Check for UO client
if [ -f "$uoamlocal/uoam_83.exe" ]; then
	echo "UO client.exe found at $uoamlocal/uoam_83.exe"
else
    echo "No Ultima Online client found at $uoamlocal/uoam_83.exe"
    exit 1
fi

cd "$CONTENTSFOLD"

# Launch UOAM 
Wineskin "$uoamlocal/uoam_83.exe"

