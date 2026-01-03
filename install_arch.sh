#!/usr/bin/env bash

set -e

iwctl station wlan0 connect "Mojo"
./mount_daemon_setup.sh
archinstall --config /mnt/setup/user_configuration.json --creds /mnt/setup/user_credentials.json
