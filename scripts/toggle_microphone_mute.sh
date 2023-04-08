#!/usr/bin/bash

pactl set-source-mute @DEFAULT_SOURCE@ toggle

mute_state=$(pactl get-source-mute @DEFAULT_SOURCE@)
if [ "$mute_state" = "Mute: yes" ]
then
    touch /tmp/microphoneismuted
else
    rm /tmp/microphoneismuted
fi

