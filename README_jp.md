<h1 align="center">awesome-dotfiles-everything</h1>

<p align="center">
  <strong>Claude Code・Codex・OpenClaw向け AI-first dotfiles ブートストラップ</strong><br>
  再現可能なローカル環境 + チームメモリ + 任意のマルチエージェント運用。
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20WSL-lightgrey" />
  <img src="https://img.shields.io/badge/AI-Claude%20Code%20%7C%20Codex%20%7C%20OpenClaw-purple" />
  <img src="https://img.shields.io/badge/superpowers-recommended-blue" />
  <img src="https://img.shields.io/badge/mode-codex--first-success" />
</p>

<p align="center">
  <a href="README.md">English</a> | <a href="README_ko.md">한국어</a> | <strong>日本語</strong> | <a href="README_zh.md">中文</a>
</p>

---

## 目次

- [これは何ですか？](#これは何ですか)
- [AIでインストール](#aiでインストール)
- [Quick Start](#quick-start)
- [コア原則](#コア原則)
- [プロジェクト開始の自動化](#プロジェクト開始の自動化)
- [推奨戦略: プロジェクトごとにクローン](#推奨戦略-プロジェクトごとにクローン)
- [Superpowers ワークフロー](#superpowers-ワークフロー)
- [Agent Team モード](#agent-team-モード)
- [OpenClaw + Discord Ops（任意）](#openclaw--discord-ops任意)
- [メモリ永続化](#メモリ永続化)
- [リポジトリ構成](#リポジトリ構成)
- [セキュリティとプライバシー](#セキュリティとプライバシー)
- [リリースノート](#リリースノート)
- [更新方法](#更新方法)

---

## これは何ですか？

どのプロジェクトでも同じ AI-ready 基盤で開始するためのスターターキットです。
- Holman スタイルの dotfiles トピック構成
- Claude/Codex 向けプロジェクト初期化プロンプト
- OpenClaw 任意連携（スケジューラ、Discord 運用ログ、メモリ同期）
- superpowers 推奨フロー（`research + plan` → 新規セッション → `/subagent-driven-development`）

---

## AIでインストール

プロジェクト初期化時に Claude/Codex へ貼り付け:

```text
次のベースラインでプロジェクトをセットアップしてください:
https://github.com/jerrygoha/awesome-dotfiles-everything

templates/PROJECT_BOOTSTRAP_PROMPT.md を厳密に従ってください。
```

---

## Quick Start

```bash
git clone https://github.com/jerrygoha/awesome-dotfiles-everything.git
cd awesome-dotfiles-everything
bash scripts/setup.sh
```

---

## コア原則

1. デフォルト実行は **Codex-first**
2. **Claude Code + Codex + OpenClaw** をサポート
3. OpenClaw 未導入時は関連機能を安全にスキップ
4. 重要な意思決定は `md/json` に永続保存
5. Ralph Loop はデフォルト OFF、必要時のみ提案

---

## プロジェクト開始の自動化

新規プロジェクト開始時:

```bash
bash scripts/new_project_bootstrap.sh /path/to/new-project
```

その後、次のファイルを AI に渡します:
- `.bootstrap/PROJECT_BOOTSTRAP_PROMPT.md`

---

## 推奨戦略: プロジェクトごとにクローン

再現性を高めるため、各プロジェクトに baseline を固定クローンする運用を推奨します。

```bash
bash scripts/new_project_bootstrap.sh /path/to/new-project --mode clone --ref v0.1.0
```

このコマンドで生成されるもの:
- `/path/to/new-project/.tooling/awesome-dotfiles-everything`
- `/path/to/new-project/.bootstrap/*`
- `/path/to/new-project/memory/*`

---

## Superpowers ワークフロー

公式:
- https://github.com/obra/superpowers

推奨フロー:
1. Research + plan（まず Markdown 計画）
2. ユーザー承認
3. 新規セッション開始
4. `/subagent-driven-development` 実行
5. 決定/タスク/会議を md/json に保存

詳細:
- `docs/SUPERPOWERS.md`

---

## Agent Team モード

参照:
- https://code.claude.com/docs/en/agent-teams

現在のスタッフボットに対応したマッピング:
- `docs/AGENT_TEAMS_MAPPING.md`

---

## OpenClaw + Discord Ops（任意）

OpenClaw がある場合:
- スケジューラフック
- Discord の意思決定/会話ログを markdown/json へ保存
- コンテキスト喪失を防ぐメモリ同期

有効化:

```bash
bash scripts/setup_openclaw_optional.sh
```

Discord 同期（任意）:

```bash
python3 scripts/discord_ops_sync.py \
  --workspace ~/.openclaw/workspace \
  --channel-map ~/.openclaw/workspace/team/automation/discord-channel-map.json
```

cron インストール:

```bash
bash scripts/install_discord_ops_cron.sh
```

詳細:
- `docs/OPENCLAW_OPTIONAL.md`
- `docs/OPENCLAW_DISCORD_OPS.md`

---

## メモリ永続化

No-loss モード保存先:
- `memory/decisions.md`
- `memory/tasks.md`
- `memory/meetings.md`
- `memory/events.jsonl`

詳細:
- `docs/MEMORY_PERSISTENCE.md`

---

## リポジトリ構成

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

## セキュリティとプライバシー

- 公開ドキュメントに個人の絶対パスを記載しない
- ローカルホスト名、トークン、個人メールをコミットしない
- 秘密情報は git 管理外の env に保存

---

## リリースノート

- `docs/releases/v0.1.1.md`
- `docs/releases/v0.1.0.md`

---

## 更新方法

```bash
# ベースライン更新
git pull --ff-only

# superpowers 更新（プロジェクト内インストール時）
cd skills/superpowers && git pull --ff-only
```
