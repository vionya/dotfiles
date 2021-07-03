#!/usr/bin/sh
rofi_command="rofi -theme ~/.config/rofi/sidebar/launcher.rasi"

incr=""
mid=""
decr=""
custom=""

options="$incr\n$mid\n$decr\n$custom"

columns=$(echo -e $options | wc -l)
width=$(( $columns * 5 ))

choice="$(echo -e "$options" | $rofi_command -dmenu -selected-row $1 -theme-str "listview { columns: $columns; } window { width: $width%; }")"

case $choice in
    $incr)
        xbacklight -inc 10 && sh ~/.config/rofi/sidebar/scripts/backlight.sh 0
        ;;
    $mid)
        xbacklight -set 50
        ;;
    $decr)
        xbacklight -dec 10 && sh ~/.config/rofi/sidebar/scripts/backlight.sh 2
        ;;
    $custom)
        value=$(echo "" | rofi -theme ~/.config/rofi/text-input.rasi -dmenu -p "Backlight %:")
        xbacklight -set $value
        ;;
esac
