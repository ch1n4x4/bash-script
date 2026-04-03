#!/bin/bash

REPORT_FILE="recon_report_$(date +%Y%m%d_%H%M%S).txt"

banner() {
	echo "=================================="
	echo "    SYSTEM RECONNAISSANCE TOOL    "
	echo "    Date: $(date)"
	echo "=================================="
	echo ""
}

collect_system_info() {
	echo "[+] SYSTEM INFORMATION"
	echo "Hostname: $(hostname)"
	echo "OS: $(cat /etc/os-release | grep PRETTY_NAME | cut -d"" -f2)"
	echo "Kernel: $(uname -r)"
	echo "Architecture: $(uname -m)"
	echo "Uptime: $(uptime -p)"
	echo ""
}

collect_network_info() {
	echo "[+] NETWORK INFORMATION"
	echo "IP Addresses:"
	ip -4 addr show | grep inet | awk '{print "  " $2}'
	echo "Default Gateway"
	ip route | grep default | awk '{print "  " $3}'
	echo "DNS Servers:"
	grep nameserver /etc/resolv.conf| awk '{print "  " $2}'
	echo ""
}

collect_user_info() {
	echo "[+] USER INFORMATION"
	echo "Current User: $(whoami)"
	echo "USer ID: $(id -u)"
	echo "Home Directory: $HOME"
	echo "Logged In Users: "
	who | awk '{print "  " $1 " - " $3 " " $4}'
	echo ""
}

collect_process_info() {
	echo "[+] PROCESS INFORMATION"
	echo "Top 5 CPU Processes:"
	ps aux --sort=-%cpu |head -6 | tail -5 | awk '{print " " $11 " - " $3"%"}'
	echo " Total Processes: $(ps aux | wc -l)"
	echo "Memoery Usage:"
	free -h | grep Mem | awk '{print " Total: " $2 " | Used: " $3 " | Free: " $4}'
	echo ""
}

collect_disk_info() {
	echo "[+] DISK INFORMATION"
	echo "Disk Usage:"
	df -h | grep -v tmpfs | grep -v udev | awk 'NR>1 {print " " $1 " - " $5 " used (" $3 "/" #2 ")"}'
	echo ""
}

{
	banner
	collect_system_info
	collect_network_info
	collect_user_info
	collect_process_info
	collect_disk_info
	echo "================================================"
	echo "       Report saved to: $REPORT_FILE"
	echo "================================================"
} | tee $REPORT_FILE

