# IDS ML Updated – Docker Compose Bundle

Runs the IDS ML updated system using official Docker Hub images:

- kanand1994/trainer
- kanand1994/detector
- kanand1994/ids_ml_updated-replay
- kanand1994/extractor
- kanand1994/ids_ml_updated-nginx

---

## Linux / macOS
```
chmod +x run.sh stop.sh
./run.sh
```

Stop:
```
./stop.sh
```

---

## Windows (PowerShell)
Start:
```
docker compose pull
docker compose up -d
```

Stop:
```
docker compose down
```

Or use:
- run.bat
- stop.bat

---

## IDS Detector Testing Steps

### 1. Copy model file
```
Copy-Item .\sample_data\rf_model.joblib .\model_data\rf_model.joblib -Force
```

### 2. Check file exists
```
Get-Item .\model_data\rf_model.joblib
```

### 3. Restart detector
```
docker compose restart detector
```

### 4. Check logs
```
docker compose logs detector --tail 20
```

### 5. Test API request (normal)
```
Invoke-RestMethod -Method Post `
    -Uri http://localhost:5000/score `
    -ContentType 'application/json' `
    -Body '{"pkt_count":3,"tot_bytes":200,"duration":0.8,"avg_pkt_len":66}'
```

### 6. Test API request (dport rule)
```
Invoke-RestMethod -Method Post `
    -Uri http://localhost:5000/score `
    -ContentType 'application/json' `
    -Body '{"pkt_count":3,"tot_bytes":200,"duration":0.8,"avg_pkt_len":66,"dport":22}'
```

## Directory Structure
```
ids_ml_updated/
  docker-compose.yml
  run.sh / stop.sh
  run.bat / stop.bat
  model_data/
  sample_data/
  logs/
```
