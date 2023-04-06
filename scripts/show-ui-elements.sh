#!/bin/sh

if [[ -f /tmp/dontchangeuielementsstate ]]
then
    exit 0
fi

kill $(
    ps -x \
        | grep '/bin/sh /home/shemishtamesh/scripts/hide-ui-elements.sh' \
        | grep -v grep \
        | awk '{print $1}'
) &
ps -x \
    | grep '/bin/sh /home/shemishtamesh/scripts/show-ui-elements.sh' \
    | grep -v $$ \
    | grep -v 'grep' \
    | awk '{print $1}' \
    | xargs -L1 kill

while [[ ! (-f /tmp/uielementsarehidden) ]]
do
    sleep 0.1
done

#bspc config window_gap 24
bspc config window_gap 0
bspc config top_padding 24
bspc config bottom_padding 24
bspc config border_width 1

rm /tmp/uielementsarehidden

