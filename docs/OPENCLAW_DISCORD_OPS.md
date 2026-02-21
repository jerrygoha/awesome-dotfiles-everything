# OpenClaw Discord Ops (Optional)

This feature is optional and should only be enabled in environments where OpenClaw + Discord bot access are available.

## What it does

- Reads messages from selected Discord channels
- Appends chat events to markdown logs
- Performs lightweight triage into decisions/tasks/meetings
- Writes JSONL event trails for long-term memory persistence

## 1) Prepare channel map

Copy template:

```bash
cp ~/.openclaw/workspace/team/automation/discord-channel-map.example.json \
   ~/.openclaw/workspace/team/automation/discord-channel-map.json
```

Then fill channel IDs.

## 2) Prepare env file

```bash
cp ~/.openclaw/workspace/team/automation/discord-ops.env.example \
   ~/.openclaw/workspace/team/automation/discord-ops.env
```

Set:
- `DISCORD_BOT_TOKEN`

## 3) Run once

```bash
python3 scripts/discord_ops_sync.py \
  --workspace ~/.openclaw/workspace \
  --channel-map ~/.openclaw/workspace/team/automation/discord-channel-map.json
```

## 4) Install cron

```bash
bash scripts/install_discord_ops_cron.sh
```

## Output paths

- `~/.openclaw/workspace/team/CONVERSATIONS/discord/YYYY-MM-DD.md`
- `~/.openclaw/workspace/team/MEETINGS.md`
- `~/.openclaw/workspace/team/DECISIONS.md`
- `~/.openclaw/workspace/team/TASKS.md`
- `~/.openclaw/workspace/team/memory/events.jsonl`

## Notes

- If OpenClaw is not installed, skip this entirely.
- Keep bot tokens out of git.
