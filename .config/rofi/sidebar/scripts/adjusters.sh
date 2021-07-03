#!/usr/bin/sh
rofi_command="rofi -theme ~/.config/rofi/sidebar/launcher.rasi"

backlight=""
volume=""

# Variable passed to rofi
options="$backlight\n$volume"

columns=$(echo -e $options | wc -l)
width=$(( $columns * 5 ))

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -theme-str "listview { columns: $columns; } window { width: $width%; }")"

case $chosen in
    $backlight)
        sh ~/.config/rofi/sidebar/scripts/backlight.sh 1
        ;;
    $volume)
        sh ~/.config/rofi/sidebar/scripts/volume.sh 1
        ;;
esac
