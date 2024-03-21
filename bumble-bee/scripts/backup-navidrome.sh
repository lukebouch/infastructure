#!/bin/bash

b2_url="b2://$BACKBLAZE_ID:$BACKBLAZE_KEY@lb-backups/duplicity/bumble-bee"

# Shutdown the app
echo "Shutting down the Navidrome app..."
cd /home/lbouch/infastructure/bumble-bee/apps/navidrome
sudo docker compose down

cd /home/lbouch/apps/navidrome

echo "Backing up Navidrome..."
duplicity backup --no-encryption . --exclude cache "${b2_url}/apps/navidrome"

# Start up the app
echo "Starting the Navidrome app back up..."
cd /home/lbouch/infastructure/bumble-bee/apps/navidrome
sudo docker compose up -d
