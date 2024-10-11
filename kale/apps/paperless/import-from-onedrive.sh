#!/bin/bash

echo "Moving files from OneDrive to the consume folder..."
su lbouch rclone move "onedrive:Scanner Inbox" /home/lbouch/apps/paperless/consume -v > /dev/stdout 2>&1
echo "Done."
