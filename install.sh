#!/bin/env bash
easy-ln() {
  ln -sf $(pwd)/$1 ~/$2
}
echo $(pwd) >>~/.dotfiles-path
easy-ln .config/fastfetch .config
easy-ln .config/fish .config
easy-ln .config/fuzzel .config
easy-ln .config/ghostty .config
easy-ln .config/mpv .config
easy-ln .config/niri .config
easy-ln .config/nvim .config
easy-ln .config/superfile .config
easy-ln .config/waybar .config
easy-ln .config/yay .config
easy-ln .local/bin .local
easy-ln .local/scripts .local
easy-ln .config/swaylock .config
