#!/bin/bash
top -bn1 | awk '/%Cpu/ {print "Total CPU Usage",100-$8,"%"}'
free -m | awk '/Mem:/ {print "Free:",($4/$2)*100,"%", "| Used:",($3/$2)*100,"%"}'
df -h / | awk 'NR==2 {print "Free:",($4/$2)*100,"%","| Used:",($3/$2)*100,"%"}'
ps -eo pid,pcpu,comm --sort=-%cpu |head -n 6
ps -eo pid,%mem,comm --sort=-%mem |head -n 6

