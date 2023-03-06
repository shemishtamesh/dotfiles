#!/bin/bash

rofi -show calc -modi calc -no-show-match -no-sort -kb-accept-custom "Control+Return" -calc-command "echo -n '{result}' | xclip -selection clipboard"

