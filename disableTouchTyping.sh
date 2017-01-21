#!/bin/bash

# make shoutcut key for this script


pgrep -f disableTouchTyping.sh | while read x; do 
	if [ $x != $$ ]; then
		kill $x
		echo "$x $$"
	fi 
done


killall syndaemon
syndaemon -i 0.3 -K -d

while [ 0 ]; do
	if [[ $(pgrep -c syndaemon) == 2 ]]; then
		killall syndaemon
		syndaemon -i 0.3 -K -d
	fi
	sleep 30
done
