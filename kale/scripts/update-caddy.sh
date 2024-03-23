#!/bin/bash

echo "Copying the Caddyfile to the correct location..."
sudo cp ~/infastructure/kale/Caddyfile /etc/caddy/Caddyfile

echo "Restarting the Caddy service..."
sudo systemctl restart caddy
