# Kripto

**kripto (Esperanto for crypto) is a simple plugin that displays the current market price of a specified crypto
currency in your Tmux status line.**

Results are cached in `~/.tmux-kripto` for 10 minutes by default.

## Requirements

- curl
- jq

### Other dependencies

Make sure you have [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm),
[jq](https://stedolan.github.io/jq/download/) and [curl](https://curl.se/) installed.

Also keep in mind that in order to correctly display the
icon you will need to use a patched [Nerd Font](https://www.nerdfonts.com/).

## Install

Then add the plugin to `~/.tmux.conf`:

```tmux
set -g @plugin 'vascomfnunes/tmux-kripto'
```

Load the plugin with `prefix + I`.

## Usage

You can add `#{kripto}` to your status line configuration if it already exists.

For example:

```tmux
set -g status-right "#{kripto}"
```

## Configuration

### Cryptocurrency

The plugin defaults to Bitcoin. You can set any other supported cryptocurrency using the following
command:

```
set -g @kripto_id "basic-attention-token"
```

The above command will use the Basic Attention Token cryptocurrency.

### Currency

The plugin defaults to US dollars. You can set any other currency using the following
tmux command:

```
set -g @kripto_currency "gbp"
```

**Reference to the Coingecko API
documentation for all the available currencies and cryptocurrencies you can use with the above two options:
[https://www.coingecko.com/en/api](https://www.coingecko.com/en/api).**

### Currency symbol

The plugin defaults to `$`. You can set any other currency symbol using the following
tmux option:

```
set -g @kripto_currency_symbol "£"
```

The above command will output the currency symbol for british pounds.

### Cache timeout

The plugin caches results by default to 10 minutes. You can set any other value in seconds using the following
option:

```
set -g @kripto_cache_seconds "900"
```

The above command will cache results for 15 minutes.

## License

This plugin is licensed under the MIT license. For more information please refer
to the [LICENSE](https://github.com/vascomfnunes/tmux-clima/LICENSE) file.
