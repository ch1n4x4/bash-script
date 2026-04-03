#!/bin/bash

show_banner() {
	echo "============================================="
	echo "        SYSTEM RECONNAISSANCE TOOL           "
	echo "============================================="
	echo ""
}

get_system_info() {
	echo "[+] System Information;"
	echo "Hostname: $(hostname)"
	echo "Kernerl: $(uname -r)"
	echo "Uptime: $(uptime -p)"
	echo ""
}

get_network_info() {
	echo "[+] Network Information"
	echo "IP Addresses: "
	ip -4 addr show | grep inet | awk '{print $2}'
	echo ""
}

get_user_info() {
	echo "[+] User Information"
	echo "Current User: $(whoami)"
	echo "User ID: $(id -u)"
	echo "Logged In Users:"
	who
	echo ""
}

show_banner
get_system_info
get_network_info
get_user_info

echo "==============================================="
echo "          Reconnaissance Complete!             "
echo "==============================================="
