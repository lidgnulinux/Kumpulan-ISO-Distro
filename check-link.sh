#!/bin/bash

link=$(grep https README.md | cut -d ']' -f 2 | tr -d "()")

for i in $link
do
    status_code=$(curl -Is $i | head -n 1 | cut -d ' ' -f 2)
    if [ $status_code -ne 200 ]; then
        echo "Error accessing $i. Status code: $status_code"
        exit 1
    fi
done

echo "All links are accessible"
exit 0
