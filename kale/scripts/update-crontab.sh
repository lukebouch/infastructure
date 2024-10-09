#!/bin/bash

echo "Updating root crontab..."
sudo crontab /home/lbouch/infastructure/kale/root.crontab
echo "Done."
