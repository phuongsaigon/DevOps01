#!/bin/bash

echo "============ Disk Volumes output ==============="
echo "=== df -h ==="
df -h
echo "=== du -sh ~/* ==="
du -sh ~/*

echo "============= CPU/cores and Memory info ======================"
/usr/sbin/system_profiler SPHardwareDataType
echo "=== memory_pressure ==="
memory_pressure
echo "=== top ==="
top -l 1 -s 0 | awk ' /Processes/ || /PhysMem/ || /Load Avg/{print}'

echo "=============== Call another shell script for memory usage =============="
~/temp/cpu_mem_check.sh

echo "===================== Mac addresses =========================="
echo "=== ifconfig -a ==="
ifconfig -a

echo "=============== End of CPU and Memory checking ================"
