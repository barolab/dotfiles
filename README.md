# Dotfiles

This repository contains all the dotfiles for my daily use. It features a bunch of scripts & config files for all the tools I'm using.

## Getting Started

All you need to do is clone this repository, and run `make help` to have details about the available commands :

```sh
$ make

Usage:
  make <target>

Targets:
  all        Installs the dotfiles, the dependencies & the binaries
  hooks      Install git hooks on this repository
  install    Installs the dependencies.
  dotfiles   Installs the dotfiles in the HOME folder.
  help       Print this help message
```

> Running `make` will bootsrap a brand new environment
