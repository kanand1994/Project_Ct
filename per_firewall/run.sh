#!/usr/bin/env bash
set -euo pipefail
echo "Pulling images from Docker Hub..."
docker compose pull

echo "Starting containers..."
docker compose up -d --remove-orphans

echo "Waiting a few seconds for containers to initialize..."
sleep 3

echo "Running 'docker ps' to show running containers:"
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
