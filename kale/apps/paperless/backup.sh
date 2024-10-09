#!/bin/bash

cd /home/lbouch/infastructure/kale/apps/paperless
echo "Exporting Paperless data for backup..."
sudo docker compose exec -it webserver document_exporter ../export -d -p -nt -na --no-progress-bar

echo "Backing up data to rsync.net..."
rsync -az --delete /home/lbouch/apps/paperless/export fm2211@fm2211.rsync.net:servers/kale/apps/paperless/export
