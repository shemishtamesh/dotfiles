#/bin/sh

if [[ $(ps -x | grep "/usr/bin/python /usr/bin/screenkey" | wc -l) > 1 ]]; then
    killall screenkey
else
    screenkey
fi

