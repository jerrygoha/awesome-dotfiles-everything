#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WORKSPACE="${OPENCLAW_WORKSPACE:-$HOME/.openclaw/workspace}"
TEAMDIR="$WORKSPACE/team"

mkdir -p "$TEAMDIR" "$TEAMDIR/automation" "$TEAMDIR/memory" "$TEAMDIR/CONVERSATIONS/discord"
cp -rn "$ROOT/templates/openclaw/." "$TEAMDIR/" 2>/dev/null || true

# Ensure core memory files exist
: > "$TEAMDIR/memory/events.jsonl"
: > "$TEAMDIR/memory/decisions.md"
: > "$TEAMDIR/memory/tasks.md"
: > "$TEAMDIR/memory/meetings.md"

# Seed automation templates (do not overwrite user files)
if [ ! -f "$TEAMDIR/automation/discord-channel-map.json" ] && [ -f "$TEAMDIR/automation/discord-channel-map.example.json" ]; then
  cp "$TEAMDIR/automation/discord-channel-map.example.json" "$TEAMDIR/automation/discord-channel-map.json"
fi
if [ ! -f "$TEAMDIR/automation/discord-ops.env" ] && [ -f "$TEAMDIR/automation/discord-ops.env.example" ]; then
  cp "$TEAMDIR/automation/discord-ops.env.example" "$TEAMDIR/automation/discord-ops.env"
fi

echo "[openclaw] optional templates synced to $TEAMDIR"
