#!/bin/zsh
__zsh_loaded_tips=()

###########################
# new entry how-to
# find the section the entry belongs to
# then add the entry in the following way
#
# # <id>
# $'text'
#
# put \x20 in a blank line to keep it in output
###########################

# systemd tips
[[ $#zsh_load_tips -eq 0 || ${zsh_load_tips[(r)systemd]} == systemd ]] && __zsh_loaded_tips+=(
# systemd-analyze-calendar
$'You can Test a systemd calendar event multiple time using
`systemd-analyze calendar "event description" --iterations=N`
\x20
\n> `systemd-analyze calendar "*-*-1/16 00:00:00" --iterations=4`'
)
