#!/usr/bin/env bash
set -euo pipefail

if ! git remote get-url upstream >/dev/null 2>&1; then
  echo "[ERROR] Missing upstream remote"
  exit 1
fi

if [[ -n "$(git status --porcelain)" ]]; then
  echo "[ERROR] Working tree dirty. Commit or stash before sync."
  exit 1
fi

git fetch upstream

UPSTREAM_HEAD_REF=$(git remote show upstream | sed -n 's/.*HEAD branch: //p')
if [[ -z "${UPSTREAM_HEAD_REF}" ]]; then
  echo "[ERROR] Cannot detect upstream default branch"
  exit 1
fi

CURRENT_BRANCH=$(git branch --show-current)
if [[ "${CURRENT_BRANCH}" != "${UPSTREAM_HEAD_REF}" ]]; then
  echo "[ERROR] Checkout ${UPSTREAM_HEAD_REF} before sync"
  exit 1
fi

git merge --ff-only "upstream/${UPSTREAM_HEAD_REF}"
git push origin "${UPSTREAM_HEAD_REF}"

echo "[OK] Upstream sync complete with fast-forward only"
