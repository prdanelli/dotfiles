#!/bin/sh

source "$CONFIG_DIR/scripts/colors.sh"

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

# sketchybar --set "$NAME" background.drawing="$SELECTED"
# the difference is in this line:
# sketchybar --set "$NAME" background.drawing="$SELECTED" color=$MAGENTA icon.highlight="$SELECTED" icon.highlight_color=$BG

COLOR=$MAGENTA

if [ $SELECTED = true ]; then
  sketchybar --set $NAME \
    background.drawing=on \
    background.color=$COLOR \
    label.color=$BG \
    icon.color=$BG
else
  sketchybar --set $NAME \
    background.drawing=off \
    label.color=$COLOR \
    icon.color=$COLOR
fi

# and mouse events for special mouse-over highlight effect
case "$SENDER" in
"mouse.entered")
  sketchybar --set $NAME icon.highlight=on background.color="$YELLOW"
  ;;
"mouse.exited" | "mouse.exited.global")
  sketchybar --set $NAME icon.highlight_color=$BG icon.highlight=$SELECTED
  ;;
"mouse.clicked")
  # clicked effect
  sketchybar --set $NAME icon.highlight_color=$BG background.color="$YELLOW"
  sketchybar --set $NAME icon.highlight=$SELECTED background.color="$YELLOW"
  ;;
esac
