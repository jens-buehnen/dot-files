#/usr/bin/env bash

waybar >/dev/null
wl-paste --watch cliphist store >/dev/null
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 >/dev/null
swaybg -i $(fd wallpaper --search-path $(xdg-user-dir PICTURES) | head -n 1) >/dev/null
gio launch ~/.config/autostart/* >/dev/null
