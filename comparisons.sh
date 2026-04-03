#!/bin/bash
NUM1=10
NUM2=20

if [ $NUM1 -eq $NUM2 ]; then
	echo "Numbers are equal"
elif [ $NUM1 -lt $NUM2 ]; then
	echo "$NUM1 is less than $NUM2"
else 
	echo "$NUM1 is greater than $NUM2"
fi

