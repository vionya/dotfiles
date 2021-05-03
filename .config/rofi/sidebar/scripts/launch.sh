#!/usr/bin/sh
rofi_command="rofi -theme ~/.config/rofi/sidebar/launcher.rasi"

# Links
launcher=""
adjusters=""
sys=""

# Variable passed to rofi
options="$launcher\n$adjusters\n$sys"

columns=$(echo -e $options | wc -l)
width=$(( $columns * 5 ))

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -columns $columns -width $width)"
case $chosen in
    $launcher)
        rofi -theme ~/.config/rofi/sidebar/apps_south.rasi -modi drun -show drun
        # rofi -modi drun -show drun
        ;;
    $adjusters)
        sh ~/.config/rofi/sidebar/scripts/adjusters.sh
        ;;
    $sys)
        sh ~/.config/rofi/sidebar/scripts/sysmenu.sh
        ;;
esac
