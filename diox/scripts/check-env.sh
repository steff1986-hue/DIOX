#!/usr/bin/env bash
set -euo pipefail

need() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "[ERROR] Missing command: $1"
    exit 1
  fi
}

need git
need gh
need bash
need node
need npm

echo "[INFO] Current branch: $(git branch --show-current)"
echo "[INFO] Git version: $(git --version)"
echo "[INFO] GitHub CLI version: $(gh --version | head -n 1)"

echo "[INFO] GitHub auth status"
gh auth status
