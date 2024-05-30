#!/usr/bin/sh
killall polybar
killall polybar
polybar -c ~/.config/polybar/config.ini top &
polybar -c ~/.config/polybar/config.ini bottom &

