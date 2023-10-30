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

[[ $#zsh_load_tips -eq 0 || ${zsh_load_tips[(r)shell]} == shell ]] && __zsh_loaded_tips+=(
# cd-oldpwd
$'You can go back to last working dir using `cd -`'
# output-pause-unpause
$'You can pause terminal output using Ctrl+S
and unpause using Ctrl+Q'
# follow-log-inode
$'You can follow log in realtime using
\t`tail -f <path>`'
# follow-log-filename
$'You can follow log path in realtime using
\t`tail -F <path>`
this continue to work even after log rotation'
)
