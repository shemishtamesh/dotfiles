#!/bin/sh
#no-rofi

if [ "$1" = "alt" ]; then
    awk '{printf("%dd %dh %dm %ds", int($1/86400), int($1%86400/3600), int(($1%3600)/60), int($1%60))}' /proc/uptime
    exit 0
fi

awk '{printf("%dd %dh", int($1/86400), int($1%86400/3600))}' /proc/uptime

