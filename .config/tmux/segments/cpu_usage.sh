#!/bin/sh
memory_line=$(top -b -n 1 | grep "%Cpu(s)")
idle=$(top -b -n 1 | grep "%Cpu(s)" | grep -Po "\d*(\.\d*)? id" | awk '{print $1}')

echo $(echo "100 - $idle" | bc)% CPU
