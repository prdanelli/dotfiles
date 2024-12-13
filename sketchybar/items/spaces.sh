#!/bin/sh

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9")
for i in "${!SPACE_ICONS[@]}"
do
  sid="$(($i+1))"
  space=(
    space="$sid"
    icon="${SPACE_ICONS[i]}"
    icon.padding_left=10
    icon.padding_right=10
    background.color="$TRANSPARENT"
    background.padding_left=0
    background.padding_right=5
    label.color="$GREEN"
    background.corner_radius=3
    background.height=22
    label.drawing=off
    icon.font="$FONT:Bold:14.0"
    script="$PLUGIN_DIR/space.sh"
    click_script="yabai -m space --focus $sid"
  )
  sketchybar --add space space."$sid" left --set space."$sid" "${space[@]}" ignore_association=on 
  sketchybar --subscribe space."$sid" mouse.clicked mouse.entered mouse.entered.global mouse.exited mouse.exited.global 
done

# https://www.josean.com/posts/sketchybar-setup
sketchybar --add item front_app left \
           --set front_app       background.color=$TRANSPARENT \
                                 icon.color=$FG \
                                 icon.font="sketchybar-app-font:Regular:16.0" \
                                 label.color=$FG \
                                 script="$PLUGIN_DIR/front_app.sh"            \
           --subscribe front_app front_app_switched

