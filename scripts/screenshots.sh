#!/bin/bash

copy_selection() {
	maim -s | xclip -selection clipboard -t image/png
}

full() {
	maim "$HOME/Pictures/Screenshots/$(date +%s).png"
}

save_selection() {
	maim -s "$HOME/Pictures/Screenshots/$(date +%s).png"
}
