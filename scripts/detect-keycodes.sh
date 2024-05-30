#!/bin/bash

bspc rule -a kitty state=floating --one-shot
kitty --execute ~/scripts/detect-keycodes-from-terminal.sh

