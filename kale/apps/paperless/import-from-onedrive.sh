#!/bin/bash

echo "Moving files from OneDrive to the consume folder..."
sudo -u lbouch rclone move "onedrive:Paperless Inbox" /home/lbouch/apps/paperless/consume -v > /dev/stdout 2>&1
echo "Done."
