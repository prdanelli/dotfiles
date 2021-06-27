#!/usr/bin/env bash

dir="~/.config/rofi"
rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
suspend=" Sleep"
logout=" Logout"

# Variable passed to rofi
options="$suspend\n$logout\n$lock\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Power Options" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
			systemctl poweroff
			;;
    $reboot)
			systemctl reboot
			;;
    $suspend)
			mpc -q pause
			systemctl suspend
			;;
    $logout)
		  bspc quit
      ;;
esac
