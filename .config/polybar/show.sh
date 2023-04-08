#!/bin/sh
if [ -f /tmp/polybarhidden ]; then
    #polybar-msg cmd show
    bspc config top_padding 24
    bspc config bottom_padding 24
    rm /tmp/polybarhidden
fi

