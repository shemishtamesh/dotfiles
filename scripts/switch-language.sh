#/usr/bin/bash

current=$(setxkbmap -query | grep layout | awk '{print $2}')
if [ $current = us ]; then
    setxkbmap -layout il
fi;
if [ $current = il ]; then
    setxkbmap -layout us
fi;

