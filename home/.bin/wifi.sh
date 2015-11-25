#!/bin/sh
bspc rule -a urxvt -o floating=on
urxvt -g 48x18+900+24 -bg '#424242' -color0 '#2d2d2d' -color1 '#8c9440' -color4 '#424242' \
-color7 '#5c5c5c' -color9 '#b5bd68' -color11 '#b5bd68' -color12 '#8c9440'  -color15 '#5c5c5c' -e sh -c 'sudo wifi-menu -o'
