#!/usr/bin/bash

nonames() {
    \cp $HOME/.config/pacwall/pacwall.conf.nonames $HOME/.config/pacwall/pacwall.conf
    pacwall -u
    exit
}

names() {
    \cp $HOME/.config/pacwall/pacwall.conf.names $HOME/.config/pacwall/pacwall.conf
    pacwall -u
    exit
}

cmp --silent $HOME/.config/pacwall/pacwall.conf.names $HOME/.config/pacwall/pacwall.conf && nonames

names

