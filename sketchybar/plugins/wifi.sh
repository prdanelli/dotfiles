#!/bin/bash

source "$CONFIG_DIR/scripts/colors.sh"

ICON_DISCONNECTED="󰖪"
ICON_CONNECTED="󰖩"

update() {
  connection=$(ipconfig getsummary $(networksetup -listallhardwareports | awk '/Hardware Port: Wi-Fi/{getline; print $2}') |
    awk '/Active : FALSE/ { print "Disconnected"; exit }
      /LinkStatusActive : TRUE/ { link_active = 1 }
      /SSID : / { ssid = $3 }
      END { if (link_active) print ssid }')

  LABEL=$connection

  if [ "$connection" = "Disconnected" ]; then
    ICON=$ICON_DISCONNECTED
    COLOR=$RED
  else
    ICON=$ICON_CONNECTED
    COLOR=$GREEN
  fi

  sketchybar --set $NAME \
    icon="$ICON" \
    label="$LABEL" \
    icon.color="$COLOR" \
    label.color="$COLOR" \
    icon.font="Hack Nerd Font Mono:Bold:23.0" \
    label.font="Hack Nerd Font Mono:Bold:13.0"
}

click() {
  CURRENT_WIDTH="$(sketchybar --query $NAME | jq -r .label.width)"

  WIDTH=0
  if [ "$CURRENT_WIDTH" -eq "0" ]; then
    WIDTH=dynamic
  fi

  sketchybar --animate sin 20 --set $NAME label.width="$WIDTH"
}

case "$SENDER" in
"wifi_change")
  update
  ;;
"mouse.clicked")
  click
  ;;
esac
