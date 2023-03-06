#!/bin/bash

bspc rule -a Alacritty state=floating --one-shot
alacritty --command ~/scripts/detect-keycodes-from-terminal.sh

