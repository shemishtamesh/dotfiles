#!/bin/bash

window_properties=$(xprop)

bspc rule -a kitty state=floating --one-shot
kitty --execute bash -c "echo '$window_properties' | nvim -R"

