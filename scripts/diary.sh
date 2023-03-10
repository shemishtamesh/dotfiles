#!/bin/zsh

bspc rule -a Alacritty state=floating --one-shot
alacritty --command nvim -c VimwikiMakeDiaryNote

