#!/bin/bash

window_properties=$(xprop)

bspc rule -a Alacritty state=floating --one-shot
alacritty --command bash -c "echo '$window_properties' | nvim -R"

