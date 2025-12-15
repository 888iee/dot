#!/bin/bash

# /home/sid/Documents/dev/py_openrgb/.venv/bin/python3 /home/sid/Documents/dev/py_openrgb/off.py
systemctl stop openrgb
i3lock -c 000000
# Wait a bit to ensure session becomes active again
sleep 1

# Check if session is active again (i.e., unlocked)
if loginctl show-session $(loginctl | grep $(whoami) | awk '{print $1}') -p Active | grep -q yes; then
  /home/sid/Documents/dev/py_openrgb/.venv/bin/python3 /home/sid/Documents/dev/py_openrgb/startup.py
fi


