# Dotfiles

This repository contains all the dotfiles for my daily use. It features a bunch of scripts & config files for all the tools I'm using.

## Getting Started

The quick setup that install everything :

```sh
cd $HOME
git clone git@github.com:barolab/dotfiles.git
cd dotfiles
make
```

You can also choose the components you want to install :

```sh
$ make help

Usage:
  make <target>

Targets:
  all        Installs the dotfiles, the dependencies & the binaries
  hooks      Install git hooks on this repository
  bin        Installs binaries in /usr/local/bin
  docker     Installs docker
  golang     Installs golang
  packages   Installs debian packages.
  dotfiles   Installs the dotfiles in the HOME folder.
  help       Print this help message
```
