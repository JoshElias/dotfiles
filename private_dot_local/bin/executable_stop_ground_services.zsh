#!/usr/bin/env zsh

services=(redis01 es01 mysql01 pg01)

for service in "${services[@]}"
do
	echo "Stopping $service..."
	docker stop $service
done

echo "All services stopped."
