#!/bin/bash

echo "======= Quick System Info ======="
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo "IP Address:"
ip -4 addr show | grep inet | awk '{print $2}'
echo "Disk Usage:"
df -h / | tail -l

echo "=================================="
