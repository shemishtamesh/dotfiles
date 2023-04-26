#!/bin/env bash

wait_time=$(rofi -dmenu -p 'wait time')
if [ -z "$wait_time" ] ; then
    bspc rule -a Alacritty state=floating --one-shot
    alacritty --command termdown "$wait_time"
    exit 0
fi

message="$(rofi -dmenu -p 'message')"

if [ -z "$message" ]; then
    bspc rule -a Alacritty state=floating --one-shot
    alacritty --command termdown "$wait_time"\
        && notify-send "timer" "timer (wait time: $wait_time) finished"
    exit 0
fi
bspc rule -a Alacritty state=floating --one-shot
alacritty --command termdown --title "$message" "$wait_time"\
    && notify-send -a "timer" "$message"

