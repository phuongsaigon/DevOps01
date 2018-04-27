#!/bin/bash

numargs=$#

if [ $numargs -ne 1 ]; then
  echo "Usage: This cript requires one of the arguments choices below:"
  echo " 1. devops01b.sh -volumes"
  echo " 2. devops01b.sh -cpu"
  echo " 3. devops01b.sh -ram"
  echo " 4. devops01b.sh -network"
  echo " 5. devops01b.sh -all"
fi

if [ "$1" == "-volumes" ]; then
  echo "============ Disk Volumes output ==============="
  echo "=== df -h ==="
  df -h
  echo "=== du -sh ~/* ==="
  du -sh ~/*
fi

if [ "$1" == "-cpu" ]; then
  echo "============= CPU/cores and Memory info ======================"
  /usr/sbin/system_profiler SPHardwareDataType
  echo "=== top ==="
  top -l 1 -s 0 | awk ' /Processes/ || /PhysMem/ || /Load Avg/{print}'
fi

if [ "$1" == "-ram" ]; then
  echo "=== memory_pressure ==="
  memory_pressure
  echo "=============== Call another shell script for memory usage =============="
  ~/temp/cpu_mem_check.sh
fi

if [ "$1" == "-network" ]; then
  echo "===================== Mac addresses =========================="
  echo "=== ifconfig -a ==="
  ifconfig -a
fi

if [ "$1" == "-all" ]; then
  ./devops01a.sh
fi


