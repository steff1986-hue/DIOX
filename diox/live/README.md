# DIOX Live MCP Bootstrap

Live architecture:

XiaoZhi device or py-xiaozhi
-> xiaozhi.me Agent DIOX
-> MCP endpoint
-> xiaozhi-mcphub or equivalent MCP bridge
-> Brave Search MCP / Fetch MCP / Time MCP
-> voice response

## Important boundaries
- GitHub stores configuration, prompts, docs, and safe scripts only.
- Live activation happens in XiaoZhi Console and MCP hub runtime.
- No secrets, tokens, or real endpoint credentials in repository.
- Keep DIOX scope focused on personal desk-assistant behavior.
