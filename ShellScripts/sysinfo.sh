
#!/bin/bash

# Author: YOUR FULL NAME
# Purpose: Generate a system information report

echo "========================================"
echo "       SYSTEM INFORMATION REPORT"
echo "========================================"

echo "Name: Piyush Sharma"
echo "Roll Number: 2601730060"
echo "Date: $(11/25/2026)"
echo ""

echo "----------- CPU INFORMATION -----------"

CPU_MODEL=$(lscpu | awk -F: '/Model name/ {gsub(/^[ \t]+/, "", $2); print $2; exit}')

CPU_CORES=$(lscpu | awk -F: '/^CPU\(s\)/ {gsub(/^[ \t]+/, "", $2); print $2; exit}')

echo "CPU Model: $CPU_MODEL"
echo "Number of CPU threads: $CPU_CORES"
echo ""

echo "----------- MEMORY INFORMATION -----------"

free -h | awk '
/^Mem:/ {
    print "Total Memory: " $2
    print "Used Memory: " $3
}'

echo ""

echo "----------- TOP 3 PROCESSES BY CPU -----------"

ps aux --sort=-%cpu | head -4

echo ""
echo "========================================"
echo "Report generated successfully."
echo "========================================"
