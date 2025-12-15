#!/bin/bash
# script to boot into windows

# this sets grubs boot target to windows temporarily
sudo grub-reboot 4 

sudo reboot now

echo "Rebooting to Windows"
