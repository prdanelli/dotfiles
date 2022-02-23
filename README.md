# dotfiles

My development environment dotfiles.

## Installation

The repo uses [Dotbot](https://github.com/anishathalye/dotbot) to manage placement of files from this repo into the correct config locations on the host machine.

Run `./install` from this directory.

## Applications

+ bspwm
+ sxhkd
+ Fish
+ Kitty
+ Starship
+ Tmux
+ Neovim
+ Polybar
+ Rofi
+ Dunst
+ Duplicity
+ Spicetify

## Screenshots

![Desktop](https://raw.githubusercontent.com/prdanelli/dotfiles/main/screenshots/desktop.jpg)
![Neovim](https://raw.githubusercontent.com/prdanelli/dotfiles/main/screenshots/nvim.jpg)

## Notes

+ Fonts will not be automatically installed.

## Nautilus

To install themes for Gnome Nautilus, copy the theme folder as below:

```bash
sudo ln -s ~/Personal/dotfiles/NordicNautilusGTK/ /usr/share/themes/NordNautilusGTK
# Or...
sudo ln -s ~/Personal/dotfiles/gruvbox-material-gtk/themes/Gruvbox-Material-Dark /usr/share/
themes/gruvbox-material-gtk

```

Then set the theme name in the fish.config:

```fish
# set -gx GTK_THEME "your-theme-name"
set -gx GTK_THEME "gruvbox-material-gtk"
```
