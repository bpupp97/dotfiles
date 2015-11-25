#! /bin/sh

if [ $(pgrep -cx panel.sh) -gt 1 ] ; then
	printf "%s\n" "The panel is already running." >&2
	exit 1
fi
fifo="/home/brandon/.bin/panel/panelFifo"
trap 'trap - TERM; kill 0' INT TERM QUIT EXIT
[ -e $fifo ] && rm $fifo
mkfifo $fifo

Memory() {
	printf "R%.f \n" $(free -m | grep Mem | awk '{print $3 / $2 * 100}')
}

Processor() {
	dat=$(top -b -n 2 -d 0.2 | grep "Cpu" | awk '{print $2 + $4}' | tail -n 2)
	echo "P"$(( ( $( echo $dat | cut -d ' ' -f 1 ) + $( echo $dat | cut -d ' ' -f 2 ) ) / 2 ))" "
}

Volume() {
	vol="V" # headphone icon
	if [[ $(pactl list sinks | grep Headphones | awk '{print $5}') == "not" ]]; then
		vol="V" # speaker icon
	fi

	if [[ $(pactl list sinks | grep Mute | tail -n 1 | cut -d ' ' -f 2) == "yes" ]]; then
		vol=$vol" MM"
	else
		vol=$vol$(pactl list sinks | grep 'Volume: front' | tail -n 1 | cut -d '/' -f 2)
	fi
	echo $vol
}

Network() {
	net=$(sudo netctl-auto current | sed -e 's/wlp1s0-//')
	[[ "$net" == "" ]] && net="Disconnected"
	echo "N "$net
}

Battery() {
	bat="B "
	if [ $(cat /sys/class/power_supply/BAT0/status) == "Charging" ]; then
		bat="B "
	fi
	echo $bat$(cat /sys/class/power_supply/BAT0/capacity)
}

Datetime() {
	date "+C%I:%M, %a %b %d"
}

# Begin harvesting data
bspc control --subscribe > $fifo &
xtitle -sf 'T%s' > $fifo &
while (true); do
	echo $(Memory) > $fifo
	sleep 0.15 
	echo $(Processor) > $fifo
	sleep 0.15
	echo $(Volume) > $fifo
	sleep 0.15
	echo $(Network) > $fifo
	sleep 0.15
	echo $(Battery) > $fifo
	sleep 0.15
	echo $(Datetime) > $fifo
done &


# Send data to processor
cat $fifo | ~/.bin/panel/processor.sh | lemonbar -f "ctrld:size=11" -f "fontawesome:size=11" -g x24 -B "#2b2b2b" | sh &

wait


