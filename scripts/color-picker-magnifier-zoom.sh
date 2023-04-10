#!/bin/zsh

sleep 0.05  # wait for rofi to close
picket | grep -v 'Screen' | grep -v 'Xorg' | grep -v 'Color' | grep -v 'Configuration' | xclip -selection clipboard

