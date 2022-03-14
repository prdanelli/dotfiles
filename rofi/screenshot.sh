#!/usr/bin/env bash

rofi_command="rofi -theme ~/Personal/dotfiles/rofi/screenshot.rasi"

# Options
full="度"
selection=""
save=""

# Variable passed to rofi
options="$full\n$selection\n$save"

chosen="$(echo -e "$options" | $rofi_command -p 'App : maim' -dmenu -selected-row 1)"
case $chosen in
    $full)
			bash -c 'source ~/Personal/dotfiles/scripts/screenshots.sh; full'
        ;;
    $selection)
			bash -c 'source ~/Personal/dotfiles/scripts/screenshots.sh; copy_selection'
        ;;
    $save)
			bash -c 'source ~/Personal/dotfiles/scripts/screenshots.sh; save_selection'
        ;;
esac

