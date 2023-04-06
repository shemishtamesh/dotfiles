if [[ $(bspc config border_width) == 0 ]]
then
    ~/scripts/force-show-ui-elements.sh
    exit 0
fi

~/scripts/force-hide-ui-elements.sh

