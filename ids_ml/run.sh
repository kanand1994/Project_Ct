#!/usr/bin/env bash
set -euo pipefail

echo "Pulling IDS-ML images..."
docker compose pull

echo "Starting IDS-ML stack..."
docker compose up -d --remove-orphans

sleep 3
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
