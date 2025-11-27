# Docker Compose Bundle for Firewall, Nginx, Replayer

This bundle lets you pull public images from Docker Hub and run three services:
- `kanand1994/firewall:latest` -> container `firewall` (host port 8080)
- `kanand1994/nginx:latest`    -> container `nginx` (host port 80)
- `kanand1994/replayer:latest` -> container `replayer` (host port 9000)

## Contents
```
docker-compose.yml
run.sh          (for Linux/macOS)
stop.sh         (for Linux/macOS)
run.bat         (for Windows)
stop.bat        (for Windows)
```

---

## Requirements
- Docker Engine + Docker Compose v2 (Docker Desktop on Windows/macOS or Docker Engine on Linux)
- On Windows: Docker Desktop running (WSL2 backend is recommended)
- Network ports used: `80`, `8080`, `9000` (change in docker-compose.yml if they conflict)

---

## Linux / macOS Usage (recommended)
1. Open terminal and change directory to this folder.
2. Make scripts executable (once):
```bash
chmod +x run.sh stop.sh
```
3. Pull images and start containers:
```bash
./run.sh
```
4. Check logs (optional):
```bash
docker logs -f firewall
docker logs -f nginx
docker logs -f replayer
```
5. To stop and remove:
```bash
./stop.sh
```

---

## Windows Usage (PowerShell or Command Prompt)

### Option A — PowerShell / CLI (preferred)
1. Open PowerShell in this folder (Shift+Right-click → "Open PowerShell window here").
2. Pull and start:
```powershell
docker compose pull
docker compose up -d
```
3. Stop:
```powershell
docker compose down
```

### Option B — Use included batch files
Double-click `run.bat` to pull & start, and `stop.bat` to stop. Or run them from Command Prompt:
```
run.bat
stop.bat
```

---

## Customization / Notes
- To change host ports, edit the left-hand side values in `ports:` (e.g., `"8081:8080"`).
- Data and config directories are mounted under `./data/` so persistent files will be stored in this folder.
- `depends_on` provides startup ordering but does not wait for full readiness; healthchecks are included to help monitoring systems detect failures.
- If you want an internal-only setup (no host ports exposed), tell me and I will provide a compose override.

---

## Troubleshooting
- `docker compose` not found: Ensure Docker Desktop or Docker Engine is installed and your PATH includes Docker. On Windows use Docker Desktop.
- Permission denied when binding to ports <1024 on Linux: either run with sudo, or change the host port to a value >=1024.
- If containers restart or fail: view container logs with `docker logs CONTAINER_NAME`.

---

If you want, I can also:
- add sample `nginx` config and index.html under `./data/nginx/html` so `http://localhost` shows a page,
- produce a Kubernetes manifest equivalent,
- push this project to a GitHub repo and connect automated builds.
