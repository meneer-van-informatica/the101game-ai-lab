#!/usr/bin/env bash
set -euo pipefail

echo '[INFO] AI lab check'

echo
echo '[1] Ollama service'
systemctl is-active ollama || true

echo
echo '[2] Ollama models'
ollama list || true

echo
echo '[3] Docker containers'
docker ps --filter name=the101game-open-webui || true

echo
echo '[4] Local OpenWebUI HTTP check'
curl -I http://127.0.0.1:3000 || true

echo
echo '[5] Listening ports'
ss -ltnp | grep -E ':(3000|11434)' || true

echo
echo '[OK] Check finished'
