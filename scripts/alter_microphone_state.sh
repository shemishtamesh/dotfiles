#!/usr/bin/bash
# no-rofi

if [[ -f /tmp/microphoneismuted ]]
then
    pactl set-source-mute @DEFAULT_SOURCE@ 0
else
    pactl set-source-mute @DEFAULT_SOURCE@ 1
fi

