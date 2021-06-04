#!/bin/bash
# Installing NVIDIA 820M in Debian

LOCALUSER=$(id -un 1000)

# Make a backup of the sources.list file
cp /etc/apt/sources.list /etc/apt/sources.list.save
cp ./buster-sources.list /etc/apt/sources.list

# Update the system
apt update

# Install necessary packages
apt install nvidia-legacy-390xx-driver firmware-misc-nonfree -yqq

# Make xorg.conf config
cp ./xorg.conf /etc/X11/xorg.conf
chmod 0644 /etc/X11/xorg.conf

# Place the following in ~/.xsessionrc

cat << EOF >> ~/.xsessionrc
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96
EOF
chmod +x /home/$LOCALUSER/.xsessionrc

## Make effect for Display Managers
# LightDM -> MATE, XFCE
# GDM -> GNOME
# SDDM -> KDE

# cat << EOF >> /usr/share/sddm/scripts/Xsetup
# # Xsetup - run as root before the login dialog appears
# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto
# xrandr --dpi 96
# EOF

#Finally reboot the system.
#EOF
