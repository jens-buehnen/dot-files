set fish_greeting
bind ctrl-f zi
if status is-interactive
    if command -v hyfetch >/dev/null
        hyfetch
    end
end
zoxide init fish | source
tide configure --auto --style=Lean --prompt_colors='16 colors' --show_time='24-hour format' --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Compact --icons='Few icons' --transient=Yes
