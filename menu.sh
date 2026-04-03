#!/bin/bash

show_menu() {
	echo "=== Security Tools Menu ==="
	echo "1. System Info" 
	echo "2. Network Info"
	echo "3. Port Scan"
	echo "4. Exit "
}

system_info() {
	echo "Hostname: $(hostname)"
	echo "User: $(whoami)"
}

network_info() {
	ip -4 addr show | grep inet | awk '{print $2}'
}

port_scan() {
	echo "Enter IP to scan:"
	read TARGET
	for PORT in 22 80 443
	do
		nc -zv -w 1 $TARGET $PORT 2>&1 | grep succeeded
	done
}

while true
do 
	show_menu
	echo "Choose option:"
	read CHOICE

	case $CHOICE in
		1) system_info ;;
		2) network_info ;;
		3) port_scan ;;
		4) echo "Goodbye!"; exit 0 ;;
		*) echo "Invalid option" ;;
	esac
	echo ""
done
