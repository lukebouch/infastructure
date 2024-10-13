#!/bin/bash

echo "Updating root crontab..."
sudo crontab /home/lbouch/infastructure/bumble-bee/root.crontab
echo "Done."
