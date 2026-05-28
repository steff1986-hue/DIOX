#!/usr/bin/env bash
set -euo pipefail

required=(
  "AGENTS.md"
  "DIOX.md"
  "diox/README.md"
  "diox/.env.example"
  "diox/prompts/diox-role-introduction.md"
  "diox/prompts/diox-short-voice-profile.md"
  "diox/prompts/diox-web-search-behavior.md"
  "diox/docs/architecture.md"
  "diox/docs/xiaozhi-console-setup.md"
  "diox/docs/repo-strategy.md"
  "diox/docs/upstream-sync.md"
  "diox/docs/internet-access-architecture.md"
  "diox/docs/mcp-tools-plan.md"
  "diox/docs/personal-assistant-safety.md"
  "diox/docs/model-benchmark-plan.md"
  "diox/docs/daily-use-cases.md"
  "diox/docs/roadmap.md"
  "diox/mcp/tool-allowlist.yaml"
  "diox/mcp/endpoint-template.example.yaml"
  "diox/mcp/brave-search-mcp-plan.md"
  "diox/mcp/fetch-mcp-plan.md"
  "diox/mcp/time-mcp-plan.md"
  "diox/mcp/tavily-firecrawl-evaluation.md"
  "diox/mcp/memory-policy.md"
  "diox/benchmarks/model-test-prompts.md"
  "diox/benchmarks/web-search-test-prompts.md"
  "diox/benchmarks/model-scorecard.csv"
  "diox/live/README.md"
  "diox/live/xiaozhi-console-live-setup.md"
  "diox/live/xiaozhi-mcphub-local-setup.md"
  "diox/live/mcp-internet-tools-setup.md"
  "diox/live/test-plan-live.md"
  "diox/live/troubleshooting.md"
  "diox/live/examples/env.example"
  "diox/live/examples/brave-search-mcp.example.md"
  "diox/live/examples/fetch-mcp.example.md"
  "diox/live/examples/time-mcp.example.md"
  "diox/scripts/check-env.sh"
  "diox/scripts/live-preflight.sh"
  "diox/scripts/print-role-prompt.sh"
  "diox/scripts/sync-upstream.sh"
  "diox/scripts/validate-diox-overlay.sh"
  "diox/scripts/create-roadmap-issues.sh"
  ".github/workflows/diox-docs-check.yml"
)

for f in "${required[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "[ERROR] Missing required file: $f"
    exit 1
  fi
done

bash -n diox/scripts/*.sh

if [[ -f ".env" ]] || find diox -maxdepth 2 -type f -name ".env" | grep -q .; then
  echo "[ERROR] Real .env file detected"
  exit 1
fi

if grep -RInE "(AKIA[0-9A-Z]{16}|BEGIN (RSA|OPENSSH|EC) PRIVATE KEY|xox[baprs]-|ghp_[A-Za-z0-9]{36}|api[_-]?key\s*[:=]\s*[A-Za-z0-9_\-]{16,}|token\s*[:=]\s*[A-Za-z0-9_\-]{16,}|password\s*[:=])" diox >/dev/null 2>&1; then
  echo "[ERROR] Potential secret pattern found in diox/"
  exit 1
fi

# Fail only on permissive/unsafe directives, not safety warnings that deny them.
if grep -RInE --exclude='validate-diox-overlay.sh' "(shell\.run:\s*allow|server\.control:\s*allow|system\.control:\s*allow|payments\.execute:\s*allow|purchases\.make:\s*allow|enable unrestricted shell|enable vps control)" diox >/dev/null 2>&1; then
  echo "[ERROR] Dangerous capability directive found"
  exit 1
fi

if grep -RInE --exclude='validate-diox-overlay.sh' "(D1OS|personal-ai-vps|external controller|private system controller)" diox >/dev/null 2>&1; then
  echo "[ERROR] Legacy unrelated reference found in diox/"
  exit 1
fi

echo "[OK] DIOX overlay validation passed"
