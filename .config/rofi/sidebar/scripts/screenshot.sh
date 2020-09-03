#!/usr/bin/sh
rofi_command="rofi -theme ~/.config/rofi/sidebar/launcher.rasi"

gui=""
full=""

options="$gui\n$full"

choice="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"

case $choice in
    $gui)
        flameshot gui &
        ;;
    $full)
        flameshot full -c &
        ;;
esac
