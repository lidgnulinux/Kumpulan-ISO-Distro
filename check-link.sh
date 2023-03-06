#!/bin/bash

link=$(grep https README.md | cut -d ']' -f 2 | tr -d "()")

for i in $link
do
	if ! wget --spider $i; then
		echo "Failed to access $i"
		break
	fi
done

exit

