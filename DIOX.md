# DIOX

## Project
- Name: DIOX
- Purpose: standalone XiaoZhi-based personal desk assistant for Stefano
- Main language: Italian

## Relationship To XiaoZhi
- Upstream firmware source: `78/xiaozhi-esp32`
- This repo keeps upstream structure intact.
- DIOX customization is isolated in overlay docs/prompts/plans.

## Target Architecture
- XiaoZhi ESP32 device or py-xiaozhi as voice/physical interface
- Agent identity: DIOX
- MCP hub/bridge as tool layer
- Approved internet tools for current information
- Optional lightweight memory with strict policy

## Internet Access
- Current/fresh information flows through approved MCP tools.
- Search + fetch + time are core first stack.

## Current Phase
- Documentation and scaffolding only.
- No firmware source modifications in this phase.

## Safety Model
- Deny-by-default tool policy
- No unrestricted shell
- No VPS/server control
- No purchase/payment automation
- No secrets in repository

## Repository Map
- `diox/README.md`: overlay overview
- `diox/prompts/`: role and behavior prompts
- `diox/docs/`: architecture, setup, strategy, roadmap
- `diox/mcp/`: tool policy and endpoint templates
- `diox/benchmarks/`: prompt suites and scorecard
- `diox/scripts/`: safe utility scripts

## Next Milestones
- Configure DIOX prompt in XiaoZhi console
- Benchmark available models for Italian voice quality/latency
- Connect MCP search/fetch/time
- Validate source-grounded responses
