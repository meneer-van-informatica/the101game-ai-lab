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
  echo '[INFO] Installing Docker from official Docker apt repository'

  apt-get update
  apt-get install -y ca-certificates curl gnupg

  install -m 0755 -d /etc/apt/keyrings

  if [ ! -f /etc/apt/keyrings/docker.asc ]; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    chmod a+r /etc/apt/keyrings/docker.asc
  fi

  . /etc/os-release

  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu ${VERSION_CODENAME} stable" > /etc/apt/sources.list.d/docker.list

  apt-get update
  apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  systemctl enable --now docker
else
  echo '[OK] Docker is already installed'
fi

echo '[INFO] Checking Docker Compose'
docker compose version

echo '[INFO] Checking Ollama'
if ! command -v ollama >/dev/null 2>&1; then
  curl -fsSL https://ollama.com/install.sh | sh
else
  echo '[OK] Ollama is already installed'
fi

systemctl enable --now ollama

echo '[INFO] Install script completed'
echo '[INFO] Next step is model pull and OpenWebUI start'
