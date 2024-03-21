#!/bin/bash

b2_url="b2://$BACKBLAZE_ID:$BACKBLAZE_KEY@lb-backups/duplicity/bumble-bee"

cd /home/lbouch/apps/actual-budget

echo "Backing up Actual Budget..."
duplicity backup --no-encryption . "${b2_url}/actual-budget"
