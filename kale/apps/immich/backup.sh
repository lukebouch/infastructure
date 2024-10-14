#!/bin/bash
echo "We are backing up Immich."

cd /home/lbouch/apps/immich

echo "Backing up database dumps..."
rsync -az --delete ./temp/db_dumps fm2211@fm2211.rsync.net:servers/kale/apps/immich/db_dumps

echo "Backing up Immich library folder..."
rsync -az --delete ./data/photos/library/library fm2211@fm2211.rsync.net:servers/kale/apps/immich/

echo "Backing up Immich upload folder..."
rsync -az --delete ./data/photos/library/upload fm2211@fm2211.rsync.net:servers/kale/apps/immich/

echo "Backing up Immich profile folder..."
rsync -az --delete ./data/photos/library/profile fm2211@fm2211.rsync.net:servers/kale/apps/immich/

echo "Done!"
