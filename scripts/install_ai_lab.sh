#!/usr/bin/env bash
set -euo pipefail

echo '[INFO] Installing AI lab prerequisites'

if [ "$(id -u)" -ne 0 ]; then
  echo '[ERROR] Run this script as root'
  exit 1
fi

cd /srv/the101game/apps/ai-lab

echo '[INFO] Checking Docker'
if ! command -v docker >/dev/null 2>&1; then
  apt-get update
  apt-get install -y docker.io docker-compose-plugin
  systemctl enable --now docker
else
  echo '[OK] Docker is already installed'
fi

echo '[INFO] Checking Ollama'
if ! command -v ollama >/dev/null 2>&1; then
  curl -fsSL https://ollama.com/install.sh | sh
else
  echo '[OK] Ollama is already installed'
fi

systemctl enable --now ollama

echo '[INFO] Install script completed'
echo '[INFO] Next step is model pull and OpenWebUI start'
