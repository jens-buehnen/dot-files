set fish_greeting
bind ctrl-f zi
zoxide init fish | source
fish_config theme choose catppuccin-mocha --color-theme=dark
if status is-interactive
    if command -v hyfetch >/dev/null
        hyfetch
    end
end
fish_vi_key_bindings
