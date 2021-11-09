#!/usr/bin/env bash

crypto_script="#($CWD/scripts/kripto.sh)"
crypto_tag="\#{kripto}"

interpolate() {
  local interpolated="$1"
  local interpolated="${interpolated/$kripto_tag/$kripto_script}"
  echo "$interpolated"
}

main() {
  set_tmux_option "status-right"
  set_tmux_option "status-left"
}
main
