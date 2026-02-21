<h1 align="center">awesome-dotfiles-everything</h1>

<p align="center">
  <strong>AI-first dotfiles bootstrap for Claude Code, Codex, and OpenClaw</strong><br>
  Reproducible local environment + team memory + optional multi-agent operations.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20WSL-lightgrey" />
  <img src="https://img.shields.io/badge/AI-Claude%20Code%20%7C%20Codex%20%7C%20OpenClaw-purple" />
  <img src="https://img.shields.io/badge/superpowers-recommended-blue" />
</p>

<p align="center">
  <strong>English</strong> | <a href="README_ko.md">한국어</a> | <a href="README_jp.md">日本語</a> | <a href="README_zh.md">中文</a>
</p>

---

## What this is

A starter kit that lets you begin any project with the same AI-ready baseline:
- consistent dotfiles layout (Holman-style topic folders)
- project bootstrap prompt for Claude/Codex
- optional OpenClaw integrations (cron, Discord ops, memory logging)
- superpowers-recommended workflow (`research + plan` → new session → `/subagent-driven-development`)

---

## Quick Start

```bash
git clone https://github.com/jerrygoha/awesome-dotfiles-everything.git
cd awesome-dotfiles-everything
bash scripts/setup.sh
```

Then in a new project, tell Claude Code:

```text
Set up this project using the baseline from https://github.com/jerrygoha/awesome-dotfiles-everything .
Follow templates/PROJECT_BOOTSTRAP_PROMPT.md exactly.
```

---

## Core Principles

1. **Codex-first execution** (default)
2. **Claude Code + Codex + OpenClaw** all supported
3. **OpenClaw optional**: if unavailable, skip gracefully
4. **Every key decision persisted** in `md/json` to avoid memory loss
5. **Use Ralph Loop only when justified** (not default)

---

## Superpowers (official)

We recommend installing and using:
- https://github.com/obra/superpowers

See full guide:
- `docs/SUPERPOWERS.md`

---

## Agent Team Mode (Claude concept)

We adopt the spirit of Claude Agent Teams:
- reference: https://code.claude.com/docs/en/agent-teams
- mapped to your current staff bots/roles

See:
- `docs/AGENT_TEAMS_MAPPING.md`
- `docs/MEMORY_PERSISTENCE.md`

---

## OpenClaw-aware behavior

If OpenClaw exists:
- enable scheduling hooks
- enable conversation/decision logs
- enable Discord ops bridge (optional)

If not installed:
- run local-only workflow without failing setup.

See:
- `docs/OPENCLAW_OPTIONAL.md`

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

Holman-inspired topic layout:
- https://github.com/holman/dotfiles/tree/master

---

## Project Kickoff Automation

When starting a new project:

```bash
bash scripts/new_project_bootstrap.sh /path/to/new-project
```

Then provide this file to Claude Code/Codex:
- `.bootstrap/PROJECT_BOOTSTRAP_PROMPT.md`

---

## Recommended Execution Flow

1. Research + plan (write the plan markdown first)
2. Get user approval
3. Start a new session
4. Run superpowers `/subagent-driven-development`
5. Persist decisions/tasks/meetings into md/json

---

## Updating This Baseline

```bash
# if connected to remote
git pull --ff-only

# optional superpowers update
cd skills/superpowers && git pull --ff-only
```
