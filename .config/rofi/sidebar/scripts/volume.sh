#!/usr/bin/sh
rofi_command="rofi -theme ~/.config/rofi/sidebar/launcher.rasi"

mid=""
decr=""
incr=""
custom=""

options="$incr\n$mid\n$decr\n$custom"

columns=$(echo -e $options | wc -l)
width=$(( $columns * 5 ))

choice="$(echo -e "$options" | $rofi_command -dmenu -selected-row $1 -columns $columns -width $width)"

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
    $custom)
        value=$(echo "" | rofi -theme ~/.config/rofi/text_input.rasi -dmenu -p "Volume %:")
        pactl set-sink-volume @DEFAULT_SINK@ ${value}%
        ;;

esac
