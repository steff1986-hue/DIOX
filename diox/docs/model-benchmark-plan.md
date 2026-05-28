# Model Benchmark Plan

Benchmark models currently available in XiaoZhi console, including:
- DeepSeek V4 Internal Test
- Qwen3 235B Fast
- DeepSeek V3.1 Powerful
- GLM 4.7 Internal Test (if available)
- GPT-5 Internal Test (if available)
- Any additional model currently listed in console

## Benchmark Dimensions
- Italian quality
- latency
- voice usability
- web-search discipline
- hallucination resistance
- ability to say "I need to search"
- concise summaries
- product comparison quality
- news summarization quality
- memory discipline
- practical usefulness

## Method
- Run same prompt suite per model.
- Score with shared scorecard.
- Repeat with and without internet tools enabled.
- Choose default model by weighted total score and latency.
