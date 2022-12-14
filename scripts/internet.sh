#!/bin/sh

# Show wifi đļ and percent strength or đĄ if none.
# Show đ if connected to ethernet or â if none.
# Show đ if a vpn connection is active

case $BLOCK_BUTTON in
	1) "$TERMINAL" -e nmtui; pkill -RTMIN+4 dwmblocks ;;
	3) notify-send "đ Internet module" "\- Click to connect
īĒŠ: wifi disabled
ī : no wifi connection
īĢ : wifi connection with quality
ī : no ethernet
ī : ethernet working
đ: vpn is active
" ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

if grep -xq 'up' /sys/class/net/w*/operstate 2>/dev/null ; then
	wifiicon="$(awk '/^\s*w/ { print "īĢ ", int($3 * 100 / 70) "% " }' /proc/net/wireless)"
elif grep -xq 'down' /sys/class/net/w*/operstate 2>/dev/null ; then
	grep -xq '0x1003' /sys/class/net/w*/flags && wifiicon="īĒŠ"|| wifiicon="ī " 
fi

printf "[%s%s%s]\n" "$wifiicon" "$(sed "s/down/ ī /;s/up/ī /" /sys/class/net/e*/operstate 2>/dev/null)" "$(sed "s/.*/đ/" /sys/class/net/tun*/operstate 2>/dev/null)"

