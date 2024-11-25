#!/bin/bash

# Prerequisite step: Create a file named urls in same folder as script and paste all links in it

export PTH='/mnt/c/Users/khhan/Downloads/elden_ring'
mkdir -p $PTH
if [ -e urls ]; then
	FILE=$(cat urls)
fi
	
for line in $FILE; do
	FILENAME=$(echo "$line" | cut -d '#' -f 2)
	DOWNLOADURL=$(curl -Ls $line | grep '"https://fuckingfast.co/dl' | sed -n 's/.*window\.open("\(.*\)".*/\1/p')
	echo "Found downloadurl $DOWNLOADURL"
	echo "Downloading to path $PTH/$FILENAME"
	curl -s $DOWNLOADURL -o $PTH/$FILENAME
	echo "Dowloaded $FILENAME"
done
