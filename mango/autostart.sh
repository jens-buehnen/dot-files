#/usr/bin/env bash

waybar &
wl-clip-persist --clipboard both &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
swaybg -i $(fd wallpaper --search-path $(xdg-user-dir PICTURES) | head -n 1) &
gio launch ~/.config/autostart/* &
