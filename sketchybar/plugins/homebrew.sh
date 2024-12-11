#!/bin/bash

source "$CONFIG_DIR/scripts/colors.sh"

COUNT="$(brew outdated | wc -l | tr -d ' ')"

COLOR=$RED

case "${COUNT}" in
[3-5][0-9])
  COLOR=$ORANGE
  ;;
[1-2][0-9])
  COLOR=$YELLOW
  ;;
[1-9])
  COLOR=$GREEN
  ;;
*) COLOR=$GREEN ;;
esac

sketchybar --set $NAME icon= label="$COUNT" icon.color=$COLOR label.color=$COLOR
