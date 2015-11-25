#!/bin/sh
if [ $(pgrep -cx "dzen2") -ge 1 ]; then
	killall dzen2
fi

scrot /tmp/powerWarp.png
convert -scale 10% -scale 1000% /tmp/powerWarp.png /tmp/powerWarp.png
bspc rule -a "feh" floating=on -o
feh -F /tmp/powerWarp.png &
myPID=$!
sleep 0.1
echo -e "\n\n^ca(1,systemctl suspend & killall dzen2)      Suspend      ^ca()\n^ca(1,reboot)       Reboot       ^ca()\n^ca(1,shutdown now)      Shutdown      ^ca()" | dzen2 -p -l 5 -sa c -w 300 -x 533 -y 300 -e "onstart=uncollapse,hide,grabkeys;key_Escape=exit" -fn "terminus:bold:size=16" -m -fg "#b5bd68" -title-name "dzenHidden"
kill $myPID
rm /tmp/powerWarp.png

