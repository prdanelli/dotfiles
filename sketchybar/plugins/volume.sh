#!/bin/sh

source "$CONFIG_DIR/scripts/config.sh"

# The volume_change event supplies a $INFO
# variable in which the current volume
# percentage is passed to the script.

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  case "$VOLUME" in
  [8-9][0-9] | 100)
    ICON=""
    COLOR=$RED
    ;;
  [3-7][0-9])
    ICON=""
    COLOR=$ORANGE
    ;;
  [1-9] | [1-2][0-9])
    ICON=""
    COLOR=$GREEN
    ;;
  *)
    ICON=""
    COLOR=$FG
    ;;
  esac

  sketchybar --set "$NAME" \
    icon="$ICON" \
    label="$VOLUME%" \
    icon.font="$FONT:Bold:27.0" \
    icon.color=$COLOR \
    label.color=$COLOR
fi
