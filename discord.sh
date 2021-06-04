#!/bin/bash
# Download and Install Discord

GETLINK=$(curl -sS "https://discord.com/api/download?platform=linux&format=deb"| awk '/https/,/deb/' | awk -F '\"' '{print $2}')
pushd /tmp/
curl --progress-bar -sLo discord.deb $GETLINK
gdebi -n discord.deb
popd
rm -r /tmp/discord.deb
#EOF