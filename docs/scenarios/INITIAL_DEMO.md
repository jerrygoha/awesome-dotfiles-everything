# Initial Demo Scenario (5-10 min)

Use this scenario to demo the full workflow to users.

## 1) Clone + setup
```bash
git clone https://github.com/jerrygoha/awesome-dotfiles-everything.git
cd awesome-dotfiles-everything
bash scripts/setup.sh
```

## 2) Bootstrap a new project
```bash
bash scripts/new_project_bootstrap.sh ~/Projects/demo-app
```

## 3) Ask AI to initialize
Send this prompt to Claude/Codex:

```text
Set up this project using:
https://github.com/jerrygoha/awesome-dotfiles-everything

Follow .bootstrap/PROJECT_BOOTSTRAP_PROMPT.md exactly.
```

## 4) Planning phase
- AI performs research + plan
- AI outputs markdown plan
- User approves or revises

## 5) New session + subagent execution
- User opens a fresh session
- Run `/subagent-driven-development`
- Execute tasks in parallel roles

## 6) Persistence check
Verify these files are being updated:
- `memory/decisions.md`
- `memory/tasks.md`
- `memory/meetings.md`
- `memory/events.jsonl`

## 7) Optional OpenClaw + Discord ops
If OpenClaw exists:
```bash
bash scripts/setup_openclaw_optional.sh
bash scripts/install_discord_ops_cron.sh
```

Then validate logs under `~/.openclaw/workspace/team/CONVERSATIONS/discord/`.
