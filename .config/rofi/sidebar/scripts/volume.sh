#!/usr/bin/sh
rofi_command="rofi -theme ~/.config/rofi/sidebar/launcher.rasi"

mid=""
decr=""
incr=""

options="$incr\n$mid\n$decr"

choice="$(echo -e "$options" | $rofi_command -dmenu -selected-row $1)"

case $choice in
    $incr)
        pactl set-sink-volume @DEFAULT_SINK@ +10% && sh ~/.config/rofi/sidebar/scripts/volume.sh 0
        ;;
    $mid) 
        pactl set-sink-mute @DEFAULT_SINK@ toggle && sh ~/.config/rofi/sidebar/scripts/volume.sh 1
        ;;
    $decr)
        pactl set-sink-volume @DEFAULT_SINK@ -10% && sh ~/.config/rofi/sidebar/scripts/volume.sh 2
        ;;
esac
