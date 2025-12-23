#!/usr/bin/env zsh

# Open the SSH tunnel in the background
open_tunnel_ground_stories_prod_bastion.zsh &

# Get the SSH command from the first script file
SSH_COMMAND=$(grep -E "^ssh -N -L" "$(which open_tunnel_ground_stories_prod_bastion.zsh)" | head -1)

# Find the SSH tunnel process using the extracted command
SSH_PID=$(pgrep -f $SSH_COMMAND)

# Wait for a moment to ensure the tunnel is established
sleep 2

# Connect to the Postgres database with a trap to ensure the SSH tunnel is killed
trap "kill $SSH_PID; unset PGPASSWORD; echo 'SSH tunnel closed'" EXIT
PGPASSWORD=$GROUND_STORIES_PROD_DB_PASS psql -h 127.0.0.1 -p 5431 -U ecs -d storiesProd -w

