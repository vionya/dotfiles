#!/usr/bin/sh
rofi_command="rofi -theme ~/.config/rofi/sidebar/launcher.rasi"

backlight=""
volume=""

# Variable passed to rofi
options="$backlight\n$volume"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"
case $chosen in
    $backlight)
        sh ~/.config/rofi/sidebar/scripts/backlight.sh 1
        ;;
    $volume)
        sh ~/.config/rofi/sidebar/scripts/volume.sh 1
        ;;
esac
