#!/bin/bash

b2_url="b2://$BACKBLAZE_ID:$BACKBLAZE_KEY@lb-backups/duplicity/bumble-bee"

cd /media/data/photos

echo "Backing up library directory..."
duplicity backup --no-encryption library "${b2_url}/immich/library"

echo "Backing up upload directory..."
duplicity backup --no-encryption upload "${b2_url}/immich/upload"

echo "Backing up profile directory..."
duplicity backup --no-encryption profile "${b2_url}/immich/profile"

# Create Database Dump
echo "Creating database dump..."
cd /home/lbouch/infastructure/bumble-bee/apps/immich
sudo docker compose exec backup ./backup.sh

# Backup Database Dump
echo "Backing up lastest database dump..."
cd /media/data/backups/immich/db_dumps/last
duplicity backup --no-encryption immich-latest.sql.gz "${b2_url}/immich/database"
