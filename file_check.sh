#!/bin/bash
echo "Enter a filename:"
read FILENAME

if [ -f $FILENAME ]; then
	echo "$FILENAME exists and is a file"
elif [ -d $FILENAME ]; then
	echo "$FILENAME exists but is a directory"
else
	echo "$FILENAME does not exist!"
fi

