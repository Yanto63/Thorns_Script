#!/usr/bin/env bash

xterm -e "watch -n 1 -d who" &

nbUsr=1

while [ $nbUsr -eq 1 ]; do
	nbUsr=$(who | wc -l)
	sleep 2
done

list=$(who)

author=$(echo "$list" | grep -v yachampeau | cut -d ' ' -f 1 | head -n 1)
target=$(echo "$list" | grep -v yachampeau | cut -d '(' -f 2 | cut -d ')' -f 1 | head -n 1)
echo "#-------Attention ! Intrusion détectée !-------#\nAuteur : $author.\nMachine : $target."
ssh -tq $target '
pactl set-sink-mute 0 toggle &&
pactl set-sink-volume 0 80% &&
mplayer ~/.music/"EXTREME LOUD INDIAN MUSIC!.mp3" &&
firefox https://www.youtube.com/watch?v=CNDI4WlJ8eo&pp=ygUZRVhUUkVNRSBMT1VEIElORElBTiBNVVNJQw%3D%3D;
'
