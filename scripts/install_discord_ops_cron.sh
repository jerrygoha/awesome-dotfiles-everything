#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WORKSPACE="${OPENCLAW_WORKSPACE:-$HOME/.openclaw/workspace}"
AUTODIR="$WORKSPACE/team/automation"
mkdir -p "$AUTODIR"

WRAPPER="$AUTODIR/run_discord_ops_sync.sh"
cat > "$WRAPPER" <<EOF
#!/usr/bin/env bash
set -euo pipefail
if [ -f "$AUTODIR/discord-ops.env" ]; then
  set -a
  source "$AUTODIR/discord-ops.env"
  set +a
fi
python3 "$ROOT/scripts/discord_ops_sync.py" \
  --workspace "$WORKSPACE" \
  --channel-map "$AUTODIR/discord-channel-map.json" \
  >> "$AUTODIR/discord-ops.log" 2>&1
EOF
chmod +x "$WRAPPER"

# Ensure templates exist for first-time setup
if [ ! -f "$AUTODIR/discord-ops.env" ] && [ -f "$AUTODIR/discord-ops.env.example" ]; then
  cp "$AUTODIR/discord-ops.env.example" "$AUTODIR/discord-ops.env"
fi
if [ ! -f "$AUTODIR/discord-channel-map.json" ] && [ -f "$AUTODIR/discord-channel-map.example.json" ]; then
  cp "$AUTODIR/discord-channel-map.example.json" "$AUTODIR/discord-channel-map.json"
fi

( crontab -l 2>/dev/null | grep -v 'run_discord_ops_sync.sh' ; echo "*/3 * * * * /usr/bin/env bash $WRAPPER" ) | crontab -

echo "[discord-ops] cron installed: */3 * * * * /usr/bin/env bash $WRAPPER"
