#!/bin/bash
#no-rofi

stty -echo;
xev -id $(xdotool getwindowfocus) | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }';
stty echo;

