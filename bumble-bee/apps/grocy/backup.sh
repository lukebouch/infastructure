#!/bin/bash

b2_url="b2://$BACKBLAZE_ID:$BACKBLAZE_KEY@lb-backups/duplicity/bumble-bee"

echo "Shutting down the Grocy app..."
cd /home/lbouch/infastructure/bumble-bee/apps/grocy
sudo docker compose down

echo "Backing up Grocy..."
cd /home/lbouch/apps/grocy
duplicity backup --no-encryption . "${b2_url}/apps/grocy"

echo "Starting the Grocy app back up..."
cd /home/lbouch/infastructure/bumble-bee/apps/grocy
sudo docker compose up -d

# Ping health check
curl https://healthchecks.lukebouch.com/ping/930c51b9-99d6-479e-ad12-9164d2ae7e09
