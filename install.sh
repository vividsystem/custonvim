#!/usr/bin/sh

CUSTONVIM=$HOME/.config/custonvim

export CUSTONVIM

rm -rf $CUSTONVIM

mkdir -p $CUSTONVIM/nvim
mkdir -p $CUSTONVIM/share

stow --restow --target=$CUSTONVIM/nvim .

alias cnv="XDG_CONFIG_HOME=$CUSTONVIM XDG_CACHE_HOME=$CUSTONVIM XDG_DATA_HOME=$CUSTONVIM/share nvim"
