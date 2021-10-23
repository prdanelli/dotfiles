#!/usr/bin/env bash

dir="~/.config/rofi"
rofi_command="rofi -theme $dir/powermenu.rasi"

disconnect_vpn() {
	/home/paul/Personal/dotfiles/openvpn/./vpn.sh --disconnect
}

# Options
# shutdown=" Shutdown"
# reboot=" Restart"
# lock=" Lock"
# suspend=" Sleep"
# logout=" Logout"

shutdown=""
reboot=""
lock=""
suspend=""
logout=""

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
			disconnect_vpn
			mpc -q pause
			systemctl suspend
			;;
    $logout)
		  bspc quit
      ;;
esac
