#!/bin/bash

b2_url="b2://$BACKBLAZE_ID:$BACKBLAZE_KEY@lb-backups/duplicity/bumble-bee"

cd /home/lbouch/apps/syncthing/data/Financial

echo "Backing up financial records..."
duplicity backup --no-encryption . "${b2_url}/financial"
