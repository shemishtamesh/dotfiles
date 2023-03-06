#!/bin/bash
#no-rofi

choice=$(find ~/scripts/ -maxdepth 1 | xargs grep -Ls '#no-rofi' | grep '.sh$' | sed 's!.*/!!' | sed 's/.sh$//g' | sort -u | rofi -dmenu -p 'script')
~/scripts/$choice.sh

