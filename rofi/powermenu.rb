#!/home/paul/.rvm/rubies/ruby-3.0.3/bin/ruby

# The Gem doesn't allow us the option of passing custom themes as arguments
require_relative "fuzz/rofi_picker.rb"

rofi_args = {
  "theme" => "~/.config/rofi/powermenu.rasi"
}

options = {
  sleep: { text: "", command: "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause; systemctl suspend" },
  shutdown: { text: "", command: "systemctl poweroff" },
  reboot: { text: "", command: "systemctl reboot" },
  logout: { text: "", command: "bspc quit" },
}

values = options.values.map { |hsh| hsh[:text] }
selector = Fuzz::Selector.new(values, picker: Fuzz::RofiPicker.new(rofi_args))
result = selector.pick

selected = options.find { |k,v| v[:text] == result }

return if selected.nil?

`#{selected.dig(1, :command)}`

