#!/bin/bash

choice=$(fc-list | awk 'BEGIN {FS=":"}; {print $1}' | sed 's/://' | rofi -dmenu -l 20 -p 'font:')
display "$choice"

