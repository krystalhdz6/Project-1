#!/bin/bash

echo "A Quick Audit" > ~/research/sys_info.txt
echo "Today's date is $(date)" >>  ~/research/sys_info.txt
echo "The operating system in this machine is $(uname)" >>  ~/research/sys_info.txt
echo "The IP address for this machine is $(ip addr | grep inet | tail -1) \ n" >>  ~/research/sys_info.txt
echo -e "Hostname: $HOSTNAME\n" >>  ~/research/sys_info.txt
echo "DNS Servers: " >>  ~/research/sys_info.txt
cat /etc/resolv.conf >>  ~/research/sys_info.txt
echo -e "\nMemory Info:" >>  ~/research/sys_info.txt
free >> ~/research/sys_info.txt
echo -e "\nCPU Info:" >>  ~/research/sys_info.txt
lscpu | grep CPU >>  ~/research/sys_info.txt
echo "\nDisk Usage:" >>  ~/research/sys_info.txt
df -H | head -2 >>  ~/research/sys_info.txt
echo -e "\nWho is logged in: \n $(who -a) \n" >>  ~/research/sys_info.txt

#Last activity

echo -e "\nExec Files" >>~/research/sys_info.txt
sudo find /home -type f -perm 777 >>~/research/sys_info.txt
echo -e "\nTop 10 Processes" >>~/research/sys_info.txt
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >>~/research/sys_info.txt
