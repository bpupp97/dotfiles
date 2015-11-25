#!/bin/sh
scrot /tmp/screenWarp.png
convert /tmp/screenWarp.png -scale 10% -scale 1000% /tmp/screenWarp.png
bspc rule -a "feh" floating=on -o
feh -F /tmp/screenWarp.png &
myPID=$!
sleep 0.1
rofi -show run -width 20 -lines 3 -font "terminus bold 16" -fg "#b5bd68" -bg "#2b2b2b" -padding 24 -bw 0 -bc "#2b2b2b" -hlbg "#5c5a5f" -hlfg "#ffffff"
kill $myPID
rm /tmp/screenWarp.png
