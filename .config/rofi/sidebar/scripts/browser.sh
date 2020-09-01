#!/usr/bin/sh

rofi_command="rofi -theme ~/.config/rofi/sidebar/launcher.rasi"

home=""
github=""
reddit=""
aniwatch=""
youtube=""

options="$home\n$github\n$reddit\n$aniwatch\n$youtube"

choice="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"

case $choice in
    $home)
        firefox --new-tab &
        ;;
    $github)
        firefox --new-tab "https://github.com/sardonicism-04" &
        ;;
    $reddit)
        firefox --new-tab "https://reddit.com" &
        ;;
    $aniwatch)
        firefox --new-tab "https://aniwatch.me/home" &
        ;;
    $youtube)
        firefox --new-tab "https://youtube.com" &
        ;;
esac
