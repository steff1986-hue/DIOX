# AGENTS

This repository contains upstream XiaoZhi firmware plus a DIOX overlay.

## Mission
- DIOX is a standalone personal desk assistant.
- Keep project direction focused on DIOX only.

## Scope Boundaries
- Keep all DIOX-specific files under `diox/`, plus this `AGENTS.md` and `DIOX.md`.
- Do not modify firmware code unless explicitly instructed.
- Do not move upstream firmware files.
- Preserve upstream syncability with `78/xiaozhi-esp32`.

## Security Rules
- Never commit secrets.
- Never create a real `.env` file.
- Never add unrestricted shell access.
- Never add VPS control.
- Never add payment or purchase automation.

## Preferred Work
- Prefer documentation, prompts, MCP plans, benchmarks, and safe scripts.
- Use small readable commits.
- Stop on failed commands and report honestly.
- Ask before destructive actions.
