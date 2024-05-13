#!/bin/bash

b2_url="b2://$BACKBLAZE_ID:$BACKBLAZE_KEY@lb-backups/duplicity/bumble-bee"

# Shutdown the app
echo "Shutting down the TimeTagger app..."
cd /home/lbouch/infastructure/bumble-bee/apps/timetagger
sudo docker compose down

# Backup
echo "Backing up TimeTagger..."
cd /home/lbouch/apps/timetagger
duplicity backup --full-if-older-than 1W --no-encryption . "${b2_url}/apps/timetagger"

# Start up the app
echo "Starting the TimeTagger app back up..."
cd /home/lbouch/infastructure/bumble-bee/apps/timetagger
sudo docker compose up -d
