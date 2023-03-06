#!/bin/zsh

picket | grep -v 'Screen' | grep -v 'Xorg' | grep -v 'Color' | grep -v 'Configuration' | xclip -selection clipboard

