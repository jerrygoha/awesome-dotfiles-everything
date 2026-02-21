#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.config"

echo "[setup] linking basic dotfiles topics"
for d in shell git tmux editor ai; do
  mkdir -p "$HOME/.config/$d"
  cp -rn "$ROOT/dotfiles/$d/." "$HOME/.config/$d/" 2>/dev/null || true
done

if command -v openclaw >/dev/null 2>&1; then
  echo "[setup] OpenClaw detected -> optional hooks enabled"
  bash "$ROOT/scripts/setup_openclaw_optional.sh" || true
  echo "[setup] Optional Discord ops: bash scripts/install_discord_ops_cron.sh"
else
  echo "[setup] OpenClaw not found -> skipping optional integration"
fi

echo "[setup] done"
