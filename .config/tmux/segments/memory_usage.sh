#!/bin/sh
memory_line=$(top -b -n 1 | grep "[KMGTPE]iB Mem")
unit=$(echo $memory_line | grep -o "^[KMGTPE]")iB
used=$(echo $memory_line | grep -Po '\d*(\.\d*)? used' | awk '{print $1}')
total=$(echo $memory_line | grep -Po '\d*(\.\d*)? total' | awk '{print $1}')

echo "$used/$total $unit RAM"

