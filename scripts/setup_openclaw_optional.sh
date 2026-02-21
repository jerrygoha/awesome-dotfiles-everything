#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$HOME/.openclaw/workspace/team"
cp -rn "$ROOT/templates/openclaw/." "$HOME/.openclaw/workspace/team/" 2>/dev/null || true
echo "[openclaw] optional templates synced"
