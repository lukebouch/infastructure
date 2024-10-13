#!/bin/bash

b2_url="b2://$BACKBLAZE_ID:$BACKBLAZE_KEY@lb-backups/duplicity/bumble-bee"

cd /home/lbouch/apps/actual-budget

echo "Backing up Actual Budget..."
duplicity backup --no-encryption . "${b2_url}/apps/actual-budget"

# Ping health check
curl https://healthchecks.lukebouch.com/ping/867c2b20-40cb-4077-8741-89f3747887ab
