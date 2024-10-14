#!/bin/bash

echo "Backing up OneDrive folders..."

echo "Downloading everything from OneDrive..."
sudo -u lbouch rclone sync "onedrive:" /home/lbouch/onedrive -v > /dev/stdout 2>&1

echo "Backing up local copy to rsync.net..."
rsync -azv --delete /home/lbouch/onedrive/ fm2211@fm2211.rsync.net:onedrive > /dev/stdout 2>&1
