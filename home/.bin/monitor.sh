#!/bin/sh
bspc rule -a urxvt -o floating=on
urxvt -g 70x6+0+24 -bg "#3c3c3c" -color8 '#a5a8a6' -e sh -c htop
