#/usr/bin/env bash

wl-clip-persist --clipboard both &
noctalia &
xremap ~/.config/xremap/config.yml &
for i in ~/.config/autostart/*; do
	gio launch "$i" &
done
