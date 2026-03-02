#!/bin/bash

FILE="system_report.txt"

{
    echo "--- SYSTEM REPORT ---"
    
    echo "Date/Time:     $(date)"
    echo "User:          $USER"
    echo "Hostname:      $(hostname)"
    echo "Internal IP:   $(hostname -I)"
    
    echo "External IP:   $(curl -s https://ifconfig.me)"
    
    echo "Distribution:  $(lsb_release -ds 2>/dev/null || cat /etc/os-release | grep PRETTY_NAME | cut -d'=' -f2)"
    echo "Uptime:        $(uptime -p)"
    
    echo "--- DISK SPACE ---"
    df -h
    
    echo "--- MEMORY (RAM) ---"
    free -h 
    
    echo "--- CPU INFO ---"
    echo "Cores:         $(nproc)"
    echo "Frequency:     $(lscpu | grep "CPU MHz" | awk '{print $3 " MHz"}')"
    
   
} > "$FILE"

echo "Done your report  $FILE"
