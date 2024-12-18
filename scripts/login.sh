#!/bin/bash

# Gather System Information
rootUsed=$(df -h / | awk 'NR==2 {print $3}')
rootTotal=$(df -h / | awk 'NR==2 {print $2}')
memUsed=$(vm_stat | awk '/Pages active/ {used=$3*4096/1024/1024/1024} END {printf "%.2fG", used}')
memTotal=$(sysctl -n hw.memsize | awk '{printf "%.2fG", $1/1073741824}')
cpuTemp=$(osx-cpu-temp) # Fetch the temperature using osx-cpu-temp
loadAvg=$(sysctl -n vm.loadavg | awk '{printf "%.2f %.2f %.2f", $2, $3, $4}')

# ASCII Logo with System Stats
cat << EOF | lolcat --truecolor --seed=22 --spread=6
    ███████╗███╗   ██╗██╗ ██████╗ ███╗   ███╗ █████╗ 
    ██╔════╝████╗  ██║██║██╔════╝ ████╗ ████║██╔══██╗
    █████╗  ██╔██╗ ██║██║██║  ███╗██╔████╔██║███████║
    ██╔══╝  ██║╚██╗██║██║██║   ██║██║╚██╔╝██║██╔══██║
    ███████╗██║ ╚████║██║╚██████╔╝██║ ╚═╝ ██║██║  ██║
    ╚══════╝╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝
  $rootUsed/$rootTotal     $memUsed/$memTotal     $cpuTemp    辰 $loadAvg
EOF
