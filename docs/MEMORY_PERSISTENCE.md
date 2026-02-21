# Memory Persistence (No-loss mode)

## Goals
- Preserve decisions, rationale, tradeoffs, and execution logs.
- Recover context after session resets.

## Required artifacts
- `memory/decisions.md`
- `memory/tasks.md`
- `memory/meetings.md`
- `memory/events.jsonl`
- `memory/agent-thoughts/<agent>.md` (optional summarized thinking)

## Logging rule
- Every significant action writes one line to `events.jsonl`.
- Every accepted decision appended to `decisions.md`.
- Daily recap generated to `meetings.md`.
