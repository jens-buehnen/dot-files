#/usr/bin/env bash

waybar &
wl-clip-persist --clipboard both &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
xremap ~/.config/xremap/config.yml &
swaybg -i $(fd wallpaper --search-path $(xdg-user-dir PICTURES) | head -n 1) &
for i in ~/.config/autostart/*; do
	gio launch "$i" &
done
