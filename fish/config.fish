source ~/.config/fish/conf.d/*
set fish_greeting
bind ctrl-f zi
bind ctrl-y yayf
bind ctrl-r _fzf_search_history
if status is-interactive
    hyfetch
end
zoxide init fish | source
starship init fish | source
