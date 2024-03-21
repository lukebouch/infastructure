#!/bin/bash

b2_url="b2://$BACKBLAZE_ID:$BACKBLAZE_KEY@lb-backups/duplicity/bumble-bee"

cd /media/data/photos

print "Backing up library directory..."
duplicity backup --no-encryption library "${b2_url}/immich/library"

print "Backing up upload directory..."
duplicity backup --no-encryption upload "${b2_url}/immich/upload"

print "Backing up profile directory..."
duplicity backup --no-encryption profile "${b2_url}/immich/profile"

# Create Database Dump
print "Creating database dump..."
cd /home/lbouch/infastructure/bumble-bee/apps/immich
sudo docker compose exec backup ./backup.sh

# Backup Database Dump
print "Backing up lastest database dump..."
cd /media/data/backups/immich/db_dumps/last
duplicity backup --no-encryption immich-latest.sql.gz "${b2_url}/immich/database"
