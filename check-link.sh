#!/bin/bash

set -eo pipefail

link=$(grep -oP '(?<=\]\().*?(?=\))' README.md)

while IFS= read -r i; do
    status_code=$(curl --head --silent --location --output /dev/null --write-out "%{http_code}" "$i")
    if [ "$status_code" -ne 200 ]; then
        echo "Error accessing $i Status code: $status_code"
        exit 1
    fi
done <<< "$link"

echo "All links are accessible"
exit 0
