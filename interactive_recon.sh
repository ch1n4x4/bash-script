#!/bin/bash

menu() {
    echo ""
    echo "=== RECONNAISSANCE MENU ==="
    echo "1. System Information"
    echo "2. Network Information"
    echo "3. User Information"
    echo "4. Process Information"
    echo "5. Disk Information"
    echo "6. Full Report (Save to File)"
    echo "7. Exit"
    echo ""
}

system_info() {
    echo "[+] SYSTEM INFORMATION"
    echo "Hostname: $(hostname)"
    echo "OS: $(cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2)"
    echo "Kernel: $(uname -r)"
    echo ""
}

network_info() {
    echo "[+] NETWORK INFORMATION"
    echo "IP Addresses:"
    ip -4 addr show | grep inet | awk '{print "  " $2}'
    echo ""
}

user_info() {
    echo "[+] USER INFORMATION"
    echo "Current User: $(whoami)"
    echo "User ID: $(id -u)"
    echo ""
}

process_info() {
    echo "[+] PROCESS INFORMATION"
    echo "Top 5 CPU Processes:"
    ps aux --sort=-%cpu | head -6 | tail -5 | awk '{print "  " $11}'
    echo ""
}

disk_info() {
    echo "[+] DISK INFORMATION"
    df -h | grep -v tmpfs | awk 'NR>1 {print "  " $1 " - " $5 " used"}'
    echo ""
}

full_report() {
    REPORT="recon_$(date +%Y%m%d_%H%M%S).txt"
    {
        system_info
        network_info
        user_info
        process_info
        disk_info
    } > $REPORT
    echo "Report saved to: $REPORT"
}

while true
do
    menu
    echo "Choose option:"
    read CHOICE
    
    case $CHOICE in
        1) system_info ;;
        2) network_info ;;
        3) user_info ;;
        4) process_info ;;
        5) disk_info ;;
        6) full_report ;;
        7) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid option" ;;
   esac
done

