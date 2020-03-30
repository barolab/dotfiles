# COLORS
TARGET_MAX_CHAR_NUM := 10
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)
PWD    := $(shell pwd)

.PHONY: all hooks bin vim golang android packages dotfiles help
default: all

## Installs the dotfiles, the dependencies & the binaries
all: packages dotfiles docker golang bin vim

## Install git hooks on this repository
hooks:
	@cp -f ./scripts/pre-commit .git/hooks
	@chmod +x .git/hooks/pre-commit

## Installs & configure vim with github.com/jessfraz/.vim
vim:
	@scripts/vim

## Installs docker
docker:
	@scripts/docker

## Installs kubectl
kubectl:
	@scripts/kubectl

## Installs golang
golang:
	@scripts/golang

## Installs android
android:
	@scripts/android

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