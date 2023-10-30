#!/bin/zsh
0=${(%):-%N}
__zsh_tips_file="${0:A:h}/tips.zsh"
if
	[[ -w ${__zsh_tips_file:P:h} ]] \
	&& [[
		-s "${__zsh_tips_file}" \
		&& (
			! -s "${__zsh_tips_file}.zwc" \
			|| "${__zsh_tips_file}" -nt "${__zsh_tips_file}.zwc"
		)
	]]
then
	builtin zcompile -Mz "${__zsh_tips_file}"
fi

(( ${+zsh_load_tips} )) || typeset -ga zsh_load_tips
(( ${+__zsh_loaded_tips} )) || typeset -ga __zsh_loaded_tips

RANDOM=$(od -vAn -N4 -tu < /dev/urandom)
tip-of-the-day()
{
	[[ -t 1 ]] || return
	if [[ ${#__zsh_loaded_tips[@]} -eq 0 || $1 == --reload ]]; then
		builtin source "$__zsh_tips_file"
	fi

	if (($#__zsh_loaded_tips > 0));then
		builtin print -Pnf '%szsh:%s Did you know?%s\n' '%B%F{green}' '%f%F{blue}' '%f%b'
		builtin printf '|\t%s\n' ${(@f)"${__zsh_loaded_tips[RANDOM % $#__zsh_loaded_tips + 1]}"}
	fi
}

! [[ $1 == onload ]] || tip-of-the-day
