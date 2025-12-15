#!/bin/bash

WALLPAPER_DIR="$HOME/Documents/nextcloud/Bilder/wallpaper"
CONFIG="$HOME/.config/hypr/hyprpaper.conf"
LOG="$HOME/.config/hypr/wallpaper_debug.log"

echo "Running wallpaper script at $(date)" > "$LOG"

# Get monitors list
readarray -t MONITORS < <(hyprctl monitors | grep 'Monitor' | awk '{print $2}')

# Get list of images shuffled
find "$WALLPAPER_DIR" -type f \( -iname "*.jpeg" -o -iname "*.jpg" -o -iname "*.png" \) | shuf > /tmp/shuffled_wallpapers.txt
readarray -t WALLPAPERS < /tmp/shuffled_wallpapers.txt

# Write config for each monitor
> "$CONFIG"
index=0
for MON in "${MONITORS[@]}"; do
    IMG="${WALLPAPERS[$index]}"
    echo "preload = $IMG" >> "$CONFIG"
    echo "wallpaper = $MON,$IMG" >> "$CONFIG"
    echo "Assigned $IMG to $MON" >> "$LOG"
    ((index++))
    if (( index >= ${#WALLPAPERS[@]} )); then
        index=0
    fi
done

# Restart hyprpaper
pkill hyprpaper
sleep 1
echo "Restarting hyprpaper..." >> "$LOG"
hyprpaper -c "$CONFIG" >> "$LOG" 2>&1 &

