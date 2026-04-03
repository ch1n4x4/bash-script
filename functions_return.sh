#!/bin/bash

check_root() {
	if [ $(id -u) -eq 0 ]; then
		return 0
	else
		return 1
	fi
}

check_root
if [ $? -eq 0 ]; then
	echo "You are root"
else
	echo "You are not root"
fi

