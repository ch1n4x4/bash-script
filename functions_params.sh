#!/bin/bash

scan_port() {
	IP=$1
	PORT=$2
	echo "Scanning $IP on port $PORT..."
	nc -zv -w 1 $IP $PORT 2>&1 | grep -i "succeeded\|open"
}

scan_port 127.0.0.1 22
scan_port 127.0.0.1 80
scan_port 127.0.0.1 443
