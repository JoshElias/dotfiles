#!/usr/bin/env bash

set -e

iwctl station wlan0 connect "Mojo"

mkdir /mnt/setup
mount /dev/sda3 /mnt/setup
archinstall --config /mnt/setup/user_configuration.json --creds /mnt/setup/user_credentials.json
