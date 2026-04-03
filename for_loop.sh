#!/bin/bash
echo "Counting from 1 to 5:"
for i in 1 2 3 4 5
do
	echo "Number: $i"
done

echo ""
echo "Checking all .sh files:"
for file in *.sh
do
	echo "Found script: $file"
done
