#!/bin/bash

pkill -USR1 -x sxhkd
pkill -USR1 -x polybar
pkill -USR1 -x dunst
bspc wm -r

