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

# zsh_load_tips=(all -<module1 [-<module2> [...]]>) for denylist
# zsh_load_tips=(<module1 [module2 [...]]>) for allowlist
(( ${+zsh_load_tips} )) || typeset -ga zsh_load_tips
(( ${+__zsh_loaded_tips} )) || typeset -ga __zsh_loaded_tips

RANDOM=$(od -vAn -N4 -tu < /dev/urandom)

tip-of-the-day()
{
	[[ -t 1 ]] || return 0
	if [[ ${#__zsh_loaded_tips[@]} -eq 0 || $1 == --reload ]]; then
		local is_tips_enabled_for="::$RANDOM/is_tips_enabled_for/$$"
		local -a tips=()
		function "$is_tips_enabled_for" {
			[[ $#zsh_load_tips -eq 0 || ("${zsh_load_tips[(r)-$1]}" != "-$1" && "${zsh_load_tips[(r)all]}" == "all") || "${zsh_load_tips[(r)$1]}" == "$1" ]]
		}

		builtin source "$__zsh_tips_file" && __zsh_loaded_tips=("${tips[@]}")

		unset "functions[$is_tips_enabled_for]" is_tips_enabled_for tips
	fi

	if (($#__zsh_loaded_tips > 0));then
		builtin print -Pnf '%szsh:%s Did you know?%s\n' '%B%F{green}' '%f%F{blue}' '%f%b'
		builtin printf '|\t%s\n' ${(@f)"${__zsh_loaded_tips[RANDOM % $#__zsh_loaded_tips + 1]}"}
	fi
}

! [[ $1 == onload ]] || tip-of-the-day
