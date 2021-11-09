#!/usr/bin/env bash

# This plugin uses the Coingecko public API: https://www.coingecko.com/en/api

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CWD/tmux.sh"

CRYPTO_CURRENCY=$(get_tmux_option "$kripto_currency" "usd")
CRYPTO_CURRENCY_SYMBOL=$(get_tmux_option "$kripto_currency_symbol" "$")
CRYPTO_ID=$(get_tmux_option "$kripto_id" "bitcoin")
CRYPTO_CACHE_SECONDS=$(get_tmux_option "$kripto_cache_seconds" "600")

cache_file=~/.tmux-kripto
cache_ttl=$CRYPTO_CACHE_SECONDS

if [[ -f "$cache_file" ]]; then
    NOW=$(date +%s)
    MOD=$(date -r "$cache_file" +%s)
    if [[ $(( $NOW - $MOD )) -gt $cache_ttl ]]; then
        rm "$cache_file"
    fi
fi

if [[ ! -f "$cache_file" ]]; then
    RESPONSE=$(curl --silent -X 'GET' https://api.coingecko.com/api/v3/coins/markets?vs_currency=${CRYPTO_CURRENCY}\&ids=${CRYPTO_ID})

    PRICE=$(echo "$RESPONSE" | jq '.[].current_price')
    echo " ${PRICE}${CRYPTO_CURRENCY_SYMBOL}" >"$cache_file"
fi

cat "$cache_file"
