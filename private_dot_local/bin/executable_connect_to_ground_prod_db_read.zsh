#!/usr/bin/env zsh

# Open the SSH tunnel in the background
open_tunnel_ground_prod_bastion.zsh &

# Capture the PID of the SSH process
SSH_PID=$!

# Wait for a moment to ensure the tunnel is established
sleep 2

# Connect to the MariaDB database
mariadb -h 127.0.0.1 -P 3307 -u ro -p --skip-ssl

# After disconnecting from the database, kill the SSH tunnel
kill $SSH_PID
