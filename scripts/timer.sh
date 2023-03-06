#!/bin/env bash

wait_time=$(rofi -dmenu -p 'wait time')
if [ -z "$wait_time" ] ; then
    exit 2
fi

message="$(rofi -dmenu -p 'message')"

if [ -z "$message" ]; then
    sleep "$wait_time" && notify-send "timer (wait time: $wait_time) finished"
    exit 0
fi
sleep "$wait_time" && notify-send -a "rofi-timer" "$message"

