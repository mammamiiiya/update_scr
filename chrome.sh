#!/bin/bash
# Script to install Google Chrome

TEMPD=$(mktemp -d)
pushd $TEMPD
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi -n google-chrome-stable_current_amd64.deb
popd
rm -rf $TEMPD
#EOF