#!/bin/sh
scrot /tmp/lockWarp.png
convert /tmp/lockWarp.png -scale 6% -scale 1668% /tmp/lockWarp.png
convert -gravity center -composite /tmp/lockWarp.png ~/.bin/lock.png /tmp/lockWarp.png 
i3lock -i /tmp/lockWarp.png --insidevercolor=ffffffff --insidewrongcolor=cc6666ff --insidecolor=00000000 --ringvercolor=b5bd68ff --ringwrongcolor=00000000 --ringcolor=00000000 --linecolor=2d2d2dff --textcolor=2d2d2dff --keyhlcolor=2d2d2dff --bshlcolor=a54242ff
rm /tmp/lockWarp.png
