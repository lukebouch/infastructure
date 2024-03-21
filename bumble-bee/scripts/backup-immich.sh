#!/bin/bash

b2_url="b2://$BACKBLAZE_ID:$BACKBLAZE_KEY@lb-backups/duplicity/bumble-bee"

cd /media/data/photos

duplicity backup --no-encryption library "${b2_url}/immich/library"
duplicity backup --no-encryption upload "${b2_url}/immich/upload"
duplicity backup --no-encryption profile "${b2_url}/immich/profile"

# Backup Database Dump
cd /media/data/backups/immich/db_dumps/last
duplicity backup --no-encryption immich-latest.sql.gz "${b2_url}/immich/database"
