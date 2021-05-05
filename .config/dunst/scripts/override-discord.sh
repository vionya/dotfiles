action=$(dunstify -a Discord -u normal -i ~/.config/dunst/scripts/assets/discord-64.png "$DUNST_SUMMARY" "$DUNST_BODY" -A "default,change window")

case $action in
    "default")
        i3-msg "[class=discord] focus"
        ;;
    "2")
        exit
        ;;
esac
