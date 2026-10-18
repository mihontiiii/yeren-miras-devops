#!/bin/bash

echo "=============================="
echo "Student Information"
echo "=============================="
echo ""
echo "Name: Miras"
echo "Surname: Yeren"
echo "Group: IT2-2308"
echo "Student ID: 41517"
echo ""
echo "=============================="
echo "System Information"
echo "=============================="
echo ""
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -s)"
echo "Disk Usage:"
df -h /
echo "Memory Usage:"
free -h
echo ""
echo "------------------------------"

INFO_FILE="$(dirname "$0")/../Yeren_Miras_info.txt"
if [ -f "$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
