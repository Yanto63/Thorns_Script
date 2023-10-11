#!/usr/bin/env bash

nbUsr=1

while [ $nbUsr -eq 1 ]; do
	nbUsr=$(who | wc -l)
	sleep 2
done

target=$(who | grep -v yachampeau | cut -d '(' -f 2 | cut -d ')' -f 1)
echo $target
ssh -q $target
