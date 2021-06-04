#!/bin/bash
# Script to install local .deb packages from their Downloads directory

LOCALUSER=$(id -un 1000)

if [ -d "/home/$LOCALUSER/Downloads" ]; then
pushd /home/$LOCALUSER/Downloads
for FILE in ./*.deb
do
    gdebi -n "$FILE"
done
popd
else
echo "No local packages (.deb) found!"
sleep 1
fi
#EOF