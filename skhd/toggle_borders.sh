#!/bin/bash

current_state=`yabai -m config window_border`
if [ "$current_state" == "on" ]; then
  new_state="off"
else
  new_state="on"
fi

yabai -m config window_border ${new_state}
