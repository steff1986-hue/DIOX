# DIOX Target Architecture

XiaoZhi ESP32 device or py-xiaozhi
-> xiaozhi.me Agent DIOX
-> MCP endpoint
-> MCP hub / bridge
-> internet tools
-> optional lightweight memory
-> voice response

## Roles
- XiaoZhi: voice and physical interface.
- DIOX: personal assistant identity and behavior.
- MCP: tool layer with explicit permissions.
- Internet search: provided by approved MCP tools.
- GitHub: project versioning and documentation tracking.

## Phase Constraints
- Current phase avoids risky automation.
- No unrestricted shell actions.
- No VPS/server control.
- No payment automation.
