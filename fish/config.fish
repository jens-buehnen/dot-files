source ~/.config/fish/conf.d/*
set fish_greeting
bind ctrl-f zi
bind ctrl-r _fzf_search_history
if status is-interactive
    if command -v hyfetch >/dev/null
        hyfetch
    end
end
zoxide init fish | source
starship init fish | source
