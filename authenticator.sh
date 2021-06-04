#!/bin/bash
# This script is to install Authenticator App from Flathub

# Installing Flatpak
apt update
apt install flatpak -yqq

# Adding Flatpak repo for GNOME Authenticator as Local User
LOCALUSER=$(id -un 1000)
su - $LOCALUSER -c "flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo"
su - $LOCALUSER -c "flatpak install -y flathub com.belmoussaoui.Authenticator"
#EOF