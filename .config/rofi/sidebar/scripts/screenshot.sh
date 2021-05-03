#!/usr/bin/sh
rofi_command="rofi -theme ~/.config/rofi/sidebar/launcher.rasi"

gui=""
full=""

options="$gui\n$full"

columns=$(echo -e $options | wc -l)
width=$(( $columns * 5 ))

choice="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -columns $columns -width $width)"

case $choice in
    $gui)
        flameshot gui &
        ;;
    $full)
        flameshot full -c &
        ;;
esac
