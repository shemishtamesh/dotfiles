#!/bin/sh
if [ -f /tmp/uielementshidden ]; then
    ~/.config/polybar/show.sh
    bspc config border_width 1
    rm /tmp/uielementshidden
else
    ~/.config/polybar/hide.sh
    bspc config border_width 0
    touch /tmp/uielementshidden
fi

