#!/bin/zsh

bspc rule -a Alacritty state=floating --one-shot
#alacritty --command nvim -c "execute 'VimwikiMakeDiaryNote' | ZenMode"
alacritty --command nvim -c VimwikiMakeDiaryNote

