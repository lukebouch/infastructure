#!/bin/bash

echo "Copying the Caddyfile to the correct location..."
sudo cp ~/infastructure/bumble-bee/Caddyfile /etc/caddy/Caddyfile

echo "Restarting the Caddy service..."
sudo systemctl restart caddy
