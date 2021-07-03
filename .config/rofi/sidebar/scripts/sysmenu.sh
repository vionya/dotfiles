#!/usr/bin/sh
rofi_command="rofi -theme ~/.config/rofi/sidebar/launcher.rasi"

exitwm=""
reboot=""
_suspend=""
shutdown=""

options="$exitwm\n$reboot\n$_suspend\n$shutdown"

columns=$(echo -e $options | wc -l)
width=$(( $columns * 5 ))

choice="$(echo -e "$options" | $rofi_command -dmenu -theme-str "listview { columns: $columns; } window { width: $width%; }")"

case $choice in
    $exitwm)
        i3-msg exit
        ;;
    $reboot)
        reboot
        ;;
    $_suspend)
        systemctl suspend
        ;;
    $shutdown)
        shutdown 0
        ;;
esac

