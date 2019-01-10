#!/bin/bash

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

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
plugins=(git gitfast git-flow kubectl last-working-dir common-aliases docker vscode golang rust node npm zsh-syntax-highlighting history-substring-search)

# Load oh-my-zsh script
# shellcheck disable=SC1090
source "$ZSH/oh-my-zsh.sh"

# Load kubectl prompt data
# shellcheck disable=SC1090
source "$ZSH/plugins/zsh-kubectl-prompt/kubectl.zsh"

# Add current kubernetes cluster to prompt
# shellcheck disable=SC2034,SC2016
RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
