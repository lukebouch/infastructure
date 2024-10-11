#!/bin/bash

echo "Moving files from OneDrive to the consume folder..."
sudo su lbouch rclone move "onedrive:Scanner Inbox" /home/lbouch/apps/paperless/consume
echo "Done."
