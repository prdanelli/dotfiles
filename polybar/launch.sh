#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.2; done

polybar -q left -c "$HOME/.config/polybar/config.ini" &

current=$(xrandr --listactivemonitors | grep -v Monitors | grep -Eo '[^ ]+$')
if [ $current == "DP-1" ]
then
	polybar -q right_external -c "$HOME/.config/polybar/config.ini" &
else
	polybar -q right -c "$HOME/.config/polybar/config.ini" &
fi

