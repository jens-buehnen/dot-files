#/usr/bin/env bash

waybar &
wl-paste --watch cliphist store &
steam -silent &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
vesktop -m &
swaybg -i $(fd wallpaper --search-path $(xdg-user-dir PICTURES) | head -n 1) &
