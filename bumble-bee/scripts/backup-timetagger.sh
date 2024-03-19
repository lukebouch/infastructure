#!/bin/bash

b2_url="b2://$BACKBLAZE_ID:$BACKBLAZE_KEY@lb-backups/duplicity/bumble-bee"

# Shutdown the app
cd /home/lbouch/infastructure/bumble-bee/apps/timetagger
sudo docker compose down

# Backup
cd /home/lbouch/apps/timetagger
duplicity backup --no-encryption . "${b2_url}/apps/timetagger"

# Start up the app
cd /home/lbouch/infastructure/bumble-bee/apps/timetagger
sudo docker compose up -d
