#!/usr/bin/env bash
set -euo pipefail

REPO="steff1986-hue/DIOX"

if ! command -v gh >/dev/null 2>&1; then
  echo "[ERROR] gh CLI not found"
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "[ERROR] gh auth not ready"
  exit 1
fi

readarray -t EXISTING_TITLES < <(gh issue list --repo "$REPO" --state open --limit 200 --json title --jq '.[].title')

exists_title() {
  local title="$1"
  for t in "${EXISTING_TITLES[@]}"; do
    if [[ "$t" == "$title" ]]; then
      return 0
    fi
  done
  return 1
}

create_if_missing() {
  local title="$1"
  local body="$2"
  if exists_title "$title"; then
    echo "[SKIP] $title"
  else
    gh issue create --repo "$REPO" --title "$title" --body "$body"
    echo "[CREATED] $title"
  fi
}

create_if_missing "P0 Configure DIOX role prompt in XiaoZhi console" "Configure DIOX role prompt and validate concise Italian voice behavior."
create_if_missing "P0 Benchmark XiaoZhi models for fast Italian voice use" "Run benchmark plan and populate model scorecard."
create_if_missing "P0 Connect DIOX to basic web search MCP" "Connect and validate basic search MCP integration."
create_if_missing "P1 Add Fetch MCP for URL reading and summaries" "Add URL fetch and summary flow after search selection."
create_if_missing "P1 Add Time MCP for date/time questions" "Add current date/time and timezone support."
create_if_missing "P1 Evaluate Brave Search MCP as default search provider" "Evaluate result quality, latency, and source reliability."
create_if_missing "P2 Evaluate Tavily or Firecrawl for deeper research" "Compare deeper extraction tools and choose one optional provider."
create_if_missing "P2 Define safe lightweight memory policy" "Implement memory policy guardrails and short-term defaults."
create_if_missing "P2 Create daily briefing workflow" "Design repeatable briefing format for morning use."
create_if_missing "P3 Evaluate optional calendar/email integrations after security review" "Scope optional integrations only after explicit security review."
create_if_missing "P3 Evaluate custom wake word and XiaoZhi assets" "Assess wake-word and persona assets without breaking upstream sync."
create_if_missing "P3 Evaluate firmware customization after hardware target is stable" "Plan firmware changes only after device target stability."

echo "[OK] Roadmap issue sync complete"
