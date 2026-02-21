<h1 align="center">awesome-dotfiles-everything</h1>

<p align="center">
  <strong>Claude Code・Codex・OpenClaw向け AI-first dotfiles ブートストラップ</strong><br>
  再現可能なローカル環境 + チームメモリ + 任意のマルチエージェント運用。
</p>

<p align="center">
  <a href="README.md">English</a> | <a href="README_ko.md">한국어</a> | <strong>日本語</strong> | <a href="README_zh.md">中文</a>
</p>

---

## 概要

どのプロジェクトでも同じ AI-ready 基盤で開始できるスターターキットです。
- 一貫した dotfiles 構成（Holman スタイル）
- Claude/Codex 用のプロジェクト初期化プロンプト
- OpenClaw 任意連携（cron, Discord 運用, メモリ記録）
- superpowers 推奨フロー（`research + plan` → 新規セッション → `/subagent-driven-development`）

## Quick Start

```bash
git clone https://github.com/jerrygoha/awesome-dotfiles-everything.git
cd awesome-dotfiles-everything
bash scripts/setup.sh
```

## ドキュメント
- `docs/SUPERPOWERS.md`
- `docs/AGENT_TEAMS_MAPPING.md`
- `docs/MEMORY_PERSISTENCE.md`
- `docs/OPENCLAW_OPTIONAL.md`
- `docs/OPENCLAW_DISCORD_OPS.md`
- `docs/RALPH_LOOP_POLICY.md`

## 新規プロジェクト開始

```bash
bash scripts/new_project_bootstrap.sh /path/to/new-project
```
