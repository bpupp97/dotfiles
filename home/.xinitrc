[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

export STEAM_FRAME_FORCE_CLOSE=1
xset -dpms; xset s off

feh --bg-scale /home/brandon/.config/wall.jpg
pulseaudio --start
sxhkd &
exec bspwm
