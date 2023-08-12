#!/bin/bash
#no-rofi

enable_middle_scroll_for_pointing_device() {
    possible_mouse_ids=$(xinput list | grep "$1" | grep 'pointer' | grep -v 'Keyboard' | awk -F '=' '{print $2}' | awk '{print $1}')
    for mouse_id in $possible_mouse_ids; do
        xinput set-prop $mouse_id "libinput Scroll Method Enabled" 0, 0, 1 &
    done
}

enable_middle_scroll_for_pointing_device 'Razer Razer DeathAdder Essential' &
# enable_middle_scroll_for_pointing_device 'Wacom One by Wacom S Pen stylus' &

