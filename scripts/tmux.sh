#!/usr/bin/env bash

get_tmux_option() {
	local option=$1
	local default_value=$2
	local option_value
	option_value="$(tmux show-option -gqv "$option")"
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

set_tmux_option() {
	local option="$1"
	local value
	value="$(get_tmux_option "$option")"
	interpolate "$value"
	tmux set-option -gq "$option" "$(interpolate "$value")"
}
