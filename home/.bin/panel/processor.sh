#! /bin/sh

while read -r line ; do
	case $line in
		W*)
			# desktop info
			wm_infos=""
			IFS=':'
			set -- ${line#?}
			while [ $# -gt 0 ] ; do
				item=$1
				name=${item#?}
				case $item in
					O*|U*)
						# focused occupied desktop
						wm_infos=$wm_infos"%{B#5c5c5c}%{+u} ${name} %{-u}%{B-}"
						;;
					F*)
						# focused free desktop
						wm_infos=$wm_infos"%{B#5c5c5c} ${name} %{B-}"
						;;
					o*|u*)
						# occupied desktop
						wm_infos=$wm_infos"%{B#4f4f4f}%{+u} ${name} %{-u}%{B-}"
						;;
					f*)
						# free desktop
						wm_infos=$wm_infos"%{B#4f4f4f} ${name} %{B-}"
						;;
				esac
				shift
			done
			;;
		R*)
			# ram info
			ram="%{B#424242}%{A:~/.bin/monitor.sh:} "${line#?}" %{A}%{B-}"
			;;
		P*)
			# processor info
			process="%{B#373737}%{A:~/.bin/monitor.sh:} "${line#?}" %{A}%{B-}"
			;;
		T*)
			# window title
			title=${line#?}
			;;
		V*)
			# volume
			volume="%{B#373737}%{A:bspc rule -a pavucontrol -o floating=on; pavucontrol &:} "${line#?}" %{A}%{B-}"
			;;
		N*)
			# network
			network="%{B#424242}%{A:~/.bin/wifi.sh:} "${line#?}" %{A}%{B-}"
			;;
		B*)
			# battery
			battery="%{B#4f4f4f} "${line#?}" %{B-}"
			;;
		C*)
			# clock
			clock="%{B#5c5c5c}%{A:~/.bin/calendar.sh:} "${line#?}" %{A}%{B-}"
			;;
	esac
	# print, center first so title gets put under if it is too long
	echo "%{c}$title"\
"%{l}$wm_infos$ram$process"\
"%{r}$volume$network$battery$clock"
done

