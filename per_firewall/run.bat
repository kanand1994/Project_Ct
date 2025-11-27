@echo off
REM Windows batch script to pull images and start compose
echo Pulling images...
docker compose pull

echo Starting containers...
docker compose up -d --remove-orphans

echo.
echo Containers running:
docker ps

pause
