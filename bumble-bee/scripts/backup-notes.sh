#!/bin/bash

b2_url="b2://$BACKBLAZE_ID:$BACKBLAZE_KEY@lb-backups/duplicity/bumble-bee"

cd /home/lbouch/apps/syncthing/data/Notes

echo "Backing up notes..."
duplicity backup --no-encryption . "${b2_url}/notes"

# Backup health check
curl https://healthchecks.lukebouch.com/ping/882dc3a6-fd2a-497c-bc71-29c0f700385f
