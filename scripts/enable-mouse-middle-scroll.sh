#!/bin/zsh
#no-rofi

mouse_id=$(xinput list | grep 'USB OPTICAL MOUSE' | grep -v 'Keyboard' | awk '{print $6 }' | awk -F '=' '{print $2}')
xinput set-prop $mouse_id "libinput Scroll Method Enabled" 0, 0, 1

