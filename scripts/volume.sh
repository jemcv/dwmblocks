#!/bin/sh

# Prints the current volume or đ if muted.

case $BLOCK_BUTTON in
	1) setsid -f "$TERMINAL" -e pulsemixer ;;
	2) pamixer -t ;;
	4) pamixer --allow-boost -i 1 ;;
	5) pamixer --allow-boost -d 1 ;;
	3) notify-send "đĸ Volume module" "\- Shows volume đ, đ if muted.
- Middle click to mute.
- Scroll to change." ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

[ $(pamixer --get-mute) = true ] && echo đ && exit

vol="$(pamixer --get-volume)"

if [ "$vol" -gt "70" ]; then
	icon="īŠŊ"
elif [ "$vol" -gt "30" ]; then
	icon="īŠŋ"
elif [ "$vol" -gt "0" ]; then
	icon="īŠž"
else
        echo đ && exit
fi

echo "[$icon $vol%]"

