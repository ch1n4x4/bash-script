#!/bin/bash
COUNT=5

echo "Countdown:"
while [ $COUNT -gt 0 ]
do
	echo "$COUNT"
	COUNT=$((COUNT -1))
	sleep 1
done
echo "Blast off!"
