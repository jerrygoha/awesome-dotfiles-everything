<h1 align="center">awesome-dotfiles-everything</h1>

<p align="center">
  <strong>AI-first dotfiles bootstrap for Claude Code, Codex, and OpenClaw</strong><br>
  Reproducible local environment + team memory + optional multi-agent operations.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20WSL-lightgrey" />
  <img src="https://img.shields.io/badge/AI-Claude%20Code%20%7C%20Codex%20%7C%20OpenClaw-purple" />
  <img src="https://img.shields.io/badge/superpowers-recommended-blue" />
  <img src="https://img.shields.io/badge/mode-codex--first-success" />
</p>

<p align="center">
  <strong>English</strong> | <a href="README_ko.md">한국어</a> | <a href="README_jp.md">日本語</a> | <a href="README_zh.md">中文</a>
</p>

---

## Table of Contents

- [What this is](#what-this-is)
- [Install with AI](#install-with-ai)
- [Quick Start](#quick-start)
- [Core Principles](#core-principles)
- [Project Kickoff Automation](#project-kickoff-automation)
- [Superpowers Workflow](#superpowers-workflow)
- [Agent Team Mode](#agent-team-mode)
- [OpenClaw + Discord Ops (Optional)](#openclaw--discord-ops-optional)
- [Memory Persistence](#memory-persistence)
- [Repository Structure](#repository-structure)
- [Security & Privacy](#security--privacy)
- [Updating This Baseline](#updating-this-baseline)

---

## What this is

A starter kit for launching projects with the same AI-ready baseline:
- Holman-style dotfiles topic layout
- project bootstrap prompt for Claude/Codex
- optional OpenClaw integrations (scheduler, Discord ops logging, memory sync)
- superpowers-recommended workflow (`research + plan` → new session → `/subagent-driven-development`)

Design references:
- Claw-Empire README style: https://github.com/GreenSheep01201/claw-empire/blob/main/README.md
- Holman dotfiles structure: https://github.com/holman/dotfiles/tree/master

---

## Install with AI

Paste this into Claude Code/Codex when bootstrapping a project:

```text
Set up this project using:
https://github.com/jerrygoha/awesome-dotfiles-everything

Follow templates/PROJECT_BOOTSTRAP_PROMPT.md exactly.
```

---

## Quick Start

```bash
git clone https://github.com/jerrygoha/awesome-dotfiles-everything.git
cd awesome-dotfiles-everything
bash scripts/setup.sh
```

---

## Core Principles

1. **Codex-first execution** (default)
2. **Claude Code + Codex + OpenClaw** all supported
3. **OpenClaw optional**: if unavailable, skip gracefully
4. **Every key decision persisted** in `md/json`
5. **Ralph Loop is off by default**, only proposed when clearly useful

---

## Project Kickoff Automation

When starting a new project:

```bash
bash scripts/new_project_bootstrap.sh /path/to/new-project
```

Then provide this file to Claude/Codex:
- `.bootstrap/PROJECT_BOOTSTRAP_PROMPT.md`

---

## Superpowers Workflow

Official repo:
- https://github.com/obra/superpowers

Recommended flow:
1. Research + plan (markdown first)
2. Get user approval
3. Start a new session
4. Run `/subagent-driven-development`
5. Persist decisions/tasks/meetings in md/json

Details:
- `docs/SUPERPOWERS.md`

---

## Agent Team Mode

Reference concept:
- https://code.claude.com/docs/en/agent-teams

This baseline includes mapping guidance for your current staff bots.
- `docs/AGENT_TEAMS_MAPPING.md`

---

## OpenClaw + Discord Ops (Optional)

If OpenClaw is installed, you can enable:
- scheduler hooks
- Discord decision/chat logging to markdown/json
- memory sync routines for no-loss operation

Quick enable:

```bash
bash scripts/setup_openclaw_optional.sh
```

Optional Discord ops sync:

```bash
python3 scripts/discord_ops_sync.py \
  --workspace ~/.openclaw/workspace \
  --channel-map ~/.openclaw/workspace/team/automation/discord-channel-map.json
```

Install cron helper:

```bash
bash scripts/install_discord_ops_cron.sh
```

Details:
- `docs/OPENCLAW_OPTIONAL.md`
- `docs/OPENCLAW_DISCORD_OPS.md`

---

## Memory Persistence

No-loss mode stores operations in:
- `memory/decisions.md`
- `memory/tasks.md`
- `memory/meetings.md`
- `memory/events.jsonl`

Details:
- `docs/MEMORY_PERSISTENCE.md`

---

## Repository Structure

```text
awesome-dotfiles-everything/
├─ dotfiles/
│  ├─ bin/
│  ├─ shell/
│  ├─ git/
│  ├─ tmux/
│  ├─ editor/
│  ├─ os/
│  └─ ai/
├─ templates/
├─ docs/
└─ scripts/
```

---

## Security & Privacy

- Do not hardcode personal absolute paths in public docs.
- Avoid committing local hostnames, private tokens, or personal emails.
- Keep secrets in local env files outside git tracking.

---

## Updating This Baseline

```bash
# pull latest baseline
git pull --ff-only

# optional superpowers update (if installed in-project)
cd skills/superpowers && git pull --ff-only
```
