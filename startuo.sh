#!/bin/bash
# Launch Razor and UOAM 8.3 from the command line.
# Just make sure you install the UORenaissance package to /Applications
# If it is installed somewhere else just change the variables in the script

# Set paths to stuff
CONTENTSFOLD="/Applications/UO Renaissance.app/Contents"
WINEPREFIX="$CONTENTSFOLD/Resources"
export PATH="$CONTENTSFOLD/Frameworks/bin:$CONTENTSFOLD/Frameworks/wswine.bundle/bin:$PATH"
export WINEPREFIX="$CONTENTSFOLD/Resources"
uorazorlocal="$WINEPREFIX/drive_c/Program Files/Razor"
uolocaldir="$WINEPREFIX/drive_c/Ultima Online"
uoamlocal="$uostorage/UOAM"

echo uostorage is $uostorage
echo contents folder is $CONTENTSFOLD
echo uoamlocal 9s $uoamlocal
# Check for UO client
if [ -f "$uolocaldir/client.exe" ]; then
	echo "UO client.exe found at $uolocaldir/client.exe"
else
    echo "No Ultima Online client found at $uolocaldir/client.exe"
    exit 1
fi

cd "$CONTENTSFOLD"

# Launch UO Razor
Wineskin "$uorazorlocal/Razor.exe"

# Launch UOAM_83
Wineskin "$uoamlocal/uoam_83.exe"

# Start Command Prompt
Wineskin "start cmd.exe"

# Start Task Manager
Wineskin "start taskmgr.exe"

