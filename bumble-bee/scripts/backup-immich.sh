#!/bin/bash

b2_url="b2://$BACKBLAZE_ID:$BACKBLAZE_KEY@lb-backups/duplicity/bumble-bee"

cd /media/data/photos

echo "Backing up library directory..."
duplicity backup --no-encryption --progress library "${b2_url}/apps/immich/library"

echo "Backing up upload directory..."
duplicity backup --no-encryption --progress upload "${b2_url}/apps/immich/upload"

echo "Backing up profile directory..."
duplicity backup --no-encryption --progress profile "${b2_url}/apps/immich/profile"

# Create Database Dump
echo "Creating database dump..."
cd /home/lbouch/infastructure/bumble-bee/apps/immich
sudo docker compose exec backup ./backup.sh

# Backup Database Dump
echo "Backing up lastest database dump..."
cd /media/data/backups/immich/db_dumps/last
duplicity backup --no-encryption --progress immich-latest.sql.gz "${b2_url}/apps/immich/database"

curl https://healthchecks.lukebouch.com/ping/4bd6c7fb-58d8-4cd9-9a64-e0a597f7438f
