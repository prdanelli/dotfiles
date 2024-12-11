#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

FONT_SIZE=15

case "${PERCENTAGE}" in
9[0-9] | 100)
  ICON="󱊣"
  ;;
[6-8][0-9])
  ICON="󱊢"
  ;;
[3-5][0-9])
  ICON="󱊢"
  ;;
[1-2][0-9])
  ICON="󱊡"
  ;;
*) ICON="󰂎" ;;
esac

if [[ "$CHARGING" != "" ]]; then
  # ICON="󰂄"
  case "${PERCENTAGE}" in
  9[0-9] | 100)
    ICON="󱊦"
    ;;
  [6-8][0-9])
    ICON="󱊥"
    ;;
  [3-5][0-9])
    ICON="󱊥"
    ;;
  [1-2][0-9])
    ICON="󱊤"
    ;;
  *) ICON="󰢟" ;;
  esac

  FONT_SIZE=23
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%" icon.font="Hack Nerd Font Mono:Bold:$FONT_SIZE.0"
