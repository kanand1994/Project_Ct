@echo off
echo Pulling IDS-ML images...
docker compose pull

echo Starting IDS-ML stack...
docker compose up -d --remove-orphans

echo.
docker ps
pause
