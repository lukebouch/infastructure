#!/bin/bash

echo "Moving files from OneDrive to the consume folder..."
rclone move "onedrive:Scanner Inbox" /home/lbouch/apps/paperless/consume
echo "Done."
