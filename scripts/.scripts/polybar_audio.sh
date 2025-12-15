#!/bin/bash
# A script for custom Polybar audio management

# Icons for volume levels and mute
MUTED_ICON=" "

# Function to get the current default sink
get_default_sink() {
  pactl get-default-sink
}

# Function to get volume and mute status
get_volume_and_status() {
  SINK=$(get_default_sink)
  VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | tr -d ' ''\n''%')
  MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
  

  if [[ "$MUTED" == "ja" ]]; then
    echo "%{T2}$MUTED_ICON%{T-} MUTED"
  else
    ICON=""

    if [[ $(pactl get-default-sink) == *"hdmi"* ]]; then
      ICON="󰓃"
    else
      ICON=""
    fi
    echo "%{T2}$ICON%{T-} $VOLUME%"
  fi
}

# Function to show audio output menu
show_output_menu() {
  OUTPUTS=$(pacmd list-sinks | awk '/name: / {print substr($2, 2, length($2)-2)}')
  CHOICE=$(echo "$OUTPUTS" | rofi -dmenu -p "Audio Output")
  
  if [ -n "$CHOICE" ]; then
    pactl set-default-sink "$CHOICE"
  fi
}

# Main functionality based on mouse clicks
case "$1" in
  "output")
    show_output_menu
    ;;
  "pavu")
    pavucontrol
    ;;
  "print")
    get_volume_and_status
    ;;
  *)
    echo "Invalid argument"
    ;;
esac

