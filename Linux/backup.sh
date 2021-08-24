#!/bin/bash

# Create /var/backup if it doesn't exist
mkdir -p /var/backup

# Create /var/backup/home.tar
tar cvf /var/backup/home.tar /home

# Move the file home.tar to /var/backup/home.MMDDYYYY.tar
mv /var/backup/home.tar /var/backup/home.01012020.tar

# Create an archive of `/home`and saves it to `/var/backup/home.tar
tar cvf /var/backup/system.tar /home

# List all files & files sizes in /var/backup, save the output to /var/backup/file_report.txt
ls -lh /var/backup > /var/backup/file_report.txt

# Print how much free memory the machine has left, Save output to a file called disk_report.txt
free -h > /var/backup/disk_report.txt


