#!/usr/bin/sh
rofi_command="rofi -theme ~/.config/rofi/sidebar/launcher.rasi"

exitwm=""
reboot=""
shutdown=""

options="$exitwm\n$reboot\n$shutdown"

choice="$(echo -e "$options" | $rofi_command -dmenu)"

case $choice in
    $exitwm)
        i3-msg exit
        ;;
    $reboot)
        reboot
        ;;
    $shutdown)
        shutdown 0
        ;;
esac

