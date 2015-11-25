#!/bin/sh

# integrate highlighting of days for current and events

calendar=$(cal)
lines=$(( $(echo "$calendar" | wc -l) + 2 ))
echo -e "\n\n$calendar" | dzen2 -p 3 -l $lines  -e "onstart=uncollapse" -fn "ctrld:size=10" -w 180 -x 1200 -y 9 -sa c -bg "#5c5c5c" -fg "#ffffff" -title-name "dzenHidden"

