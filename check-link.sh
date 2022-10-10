#!/bin/bash

link=$(grep https README.md | cut -d ']' -f 2 | cut -d '(' -f 2 | cut -d ')' -f 1)

for i in $link
do
	wget --spider $i
done
