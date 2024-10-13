#!/bin/bash

b2_url="b2://$BACKBLAZE_ID:$BACKBLAZE_KEY@lb-backups/duplicity/bumble-bee"

cd /home/lbouch/apps/syncthing/data/Financial

echo "Backing up financial records..."
duplicity backup --no-encryption . "${b2_url}/financial"

# Ping health check
curl https://healthchecks.lukebouch.com/ping/88f66627-6c4d-4dd7-9e07-701ee03d66e5
