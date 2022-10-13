#!/bin/bash

link=$(grep https README.md | cut -d ']' -f 2 | tr -d "()"

for i in $link
do
	wget --spider $i
done
