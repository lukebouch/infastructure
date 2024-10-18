#!/bin/bash
PW_FILE_PATH=/home/lbouch/apps/mosquitto/config/pwfile

sudo rm -f $PW_FILE_PATH
sudo touch $PW_FILE_PATH

# echo $(op item get "Mosquitto Credentials (Bumble Bee)" --vault "Bumble Bee" --field notesPlain) >> $PW_FILE_PATH

# cd /home/lbouch/infastructure/bumble-bee/apps/mosquitto
# sudo docker compose restart
