#!/usr/bin/env bash
set -euo pipefail

missing_count=0

check_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "[WARN] Missing command: $1"
    missing_count=$((missing_count + 1))
  else
    echo "[OK] Found command: $1"
  fi
}

check_cmd git
check_cmd gh
check_cmd docker
check_cmd node
check_cmd npm

if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
  echo "[OK] Found command: docker compose"
elif command -v docker-compose >/dev/null 2>&1; then
  echo "[OK] Found command: docker-compose"
else
  echo "[WARN] Missing command: docker compose"
  missing_count=$((missing_count + 1))
fi

echo "[INFO] Branch: $(git branch --show-current)"

if [[ ! -f "diox/prompts/diox-role-introduction.md" ]]; then
  echo "[ERROR] Missing role prompt file"
  exit 1
fi

if find diox -type f -name ".env" | grep -q .; then
  echo "[ERROR] Real .env file found under diox/"
  exit 1
fi

if [[ $missing_count -gt 0 ]]; then
  echo "[WARN] Live preflight completed with missing tooling: $missing_count"
  exit 0
fi

echo "[OK] Live preflight passed"
