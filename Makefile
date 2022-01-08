# COLORS
TARGET_MAX_CHAR_NUM := 10
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)
PWD    := $(shell pwd)

.PHONY: all hooks vim ash asdf docker packages dotfiles help
default: help

## Installs the dotfiles, the dependencies & the binaries
all: packages zsh asdf dotfiles docker golang vim

## Install git hooks on this repository
hooks:
	@cp -f ./scripts/pre-commit .git/hooks
	@chmod +x .git/hooks/pre-commit

## Installs & configure vim with github.com/jessfraz/.vim
vim:
	@scripts/vim

## Installs & configure zsh
zsh:
	@scripts/zsh

## Installs & configure asdf
asdf:
	@scripts/asdf

## Installs docker
docker:
	@scripts/docker

## Installs golang tools
golang:
	@scripts/golang

## Installs debian packages.
packages:
	@scripts/packages

## Installs the dotfiles in the HOME folder.
dotfiles:
	@scripts/dotfiles

## Print this help message
help:
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)