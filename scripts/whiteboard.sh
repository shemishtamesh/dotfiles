#!/bin/sh

# bspc rule -a rnote state=floating --one-shot  # can't open as fullscreen for some reason
# rnote ~/whiteboard/whiteboard.rnote

bspc rule -a milton state=fullscreen --one-shot
current_node_amount=$(bspc query -N | wc -l)

milton &
while [[ $(bspc query -N | wc -l) -le $current_node_amount ]]; do sleep 0.1; done;
