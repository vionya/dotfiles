#!/usr/bin/sh
rofi_command="rofi -theme ~/.config/rofi/sidebar/launcher.rasi"

# Links
launcher=""
browser=""
screenshot=""
adjusters=""
sys=""

# Variable passed to rofi
options="$launcher\n$browser\n$screenshot\n$adjusters\n$sys"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"
case $chosen in
    $launcher)
        rofi -theme ~/.config/rofi/sidebar/apps.rasi -modi drun -show drun
        ;;
    $browser)
        sh ~/.config/rofi/sidebar/scripts/browser.sh
        ;;
    $screenshot)
        sh ~/.config/rofi/sidebar/scripts/screenshot.sh
        ;;
    $adjusters)
        sh ~/.config/rofi/sidebar/scripts/adjusters.sh
        ;;
    $sys)
        sh ~/.config/rofi/sidebar/scripts/sysmenu.sh
        ;;
esac
