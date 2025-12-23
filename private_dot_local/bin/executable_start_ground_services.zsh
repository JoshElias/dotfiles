#!/usr/bin/env zsh

services=(redis01 es01 mysql01 pg01)

for service in "${services[@]}"
do
	echo "Starting $service..."
	docker start $service
done

echo "All services started."
