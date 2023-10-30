#!/bin/zsh
__zsh_loaded_tips=()

# systemd tips
[[ $#zsh_load_tips -eq 0 || ${zsh_load_tips[(r)systemd]} == systemd ]] && __zsh_loaded_tips+=(
# systemd-analyze-calendar
$'You can Test a systemd calendar event multiple time using
`systemd-analyze calendar "event description" --iterations=N`
\x20
\n> `systemd-analyze calendar "*-*-1/16 00:00:00" --iterations=4`'
)
