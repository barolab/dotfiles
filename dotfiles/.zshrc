#!/bin/bash

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

# Load user profile
# shellcheck disable=SC1090
source "$HOME/.profile"

# Load colors
autoload -U colors; colors

# ZSH Theme by default
# shellcheck disable=SC2034
ZSH_THEME="robbyrussell"

# Metric date format
# shellcheck disable=SC2034
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# shellcheck disable=SC2034
plugins=(git asdf gitfast git-flow terraform last-working-dir common-aliases docker vscode golang rust history-substring-search autoswitch_virtualenv)

# Load modules for completion
autoload -U compinit && compinit

# Load oh-my-zsh script
# shellcheck disable=SC1090
source "$ZSH/oh-my-zsh.sh"

# Enable kubectl zsh completion
if hash kubectl 2>/dev/null; then
	# shellcheck source=/dev/null
	source <(kubectl completion zsh)
fi

# Load kubectl prompt data
# shellcheck disable=SC1090
# source "$ZSH/plugins/zsh-kubectl-prompt/kubectl.zsh"

# Enable staship
eval "$(starship init zsh)"
