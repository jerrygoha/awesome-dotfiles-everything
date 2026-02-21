<h1 align="center">awesome-dotfiles-everything</h1>

<p align="center">
  <strong>面向 Claude Code / Codex / OpenClaw 的 AI-first dotfiles 启动模板</strong><br>
  可复现本地环境 + 团队记忆 + 可选多代理协作。
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20WSL-lightgrey" />
  <img src="https://img.shields.io/badge/AI-Claude%20Code%20%7C%20Codex%20%7C%20OpenClaw-purple" />
  <img src="https://img.shields.io/badge/superpowers-recommended-blue" />
  <img src="https://img.shields.io/badge/mode-codex--first-success" />
</p>

<p align="center">
  <a href="README.md">English</a> | <a href="README_ko.md">한국어</a> | <a href="README_jp.md">日本語</a> | <strong>中文</strong>
</p>

---

## 目录

- [这是什么？](#这是什么)
- [用 AI 安装](#用-ai-安装)
- [快速开始](#快速开始)
- [核心原则](#核心原则)
- [项目启动自动化](#项目启动自动化)
- [推荐策略：每个项目独立克隆](#推荐策略每个项目独立克隆)
- [Superpowers 工作流](#superpowers-工作流)
- [Agent Team 模式](#agent-team-模式)
- [OpenClaw + Discord Ops（可选）](#openclaw--discord-ops可选)
- [记忆持久化](#记忆持久化)
- [仓库结构](#仓库结构)
- [安全与隐私](#安全与隐私)
- [发布说明](#发布说明)
- [更新方式](#更新方式)

---

## 这是什么？

这是一个让你在任何项目中快速落地统一 AI-ready 基线的启动模板：
- Holman 风格 dotfiles 主题目录
- 面向 Claude/Codex 的项目初始化提示词
- OpenClaw 可选集成（调度、Discord 运营日志、记忆同步）
- 推荐 superpowers 流程（`research + plan` → 新会话 → `/subagent-driven-development`）

---

## 用 AI 安装

项目初始化时，将以下内容发给 Claude/Codex：

```text
请基于以下基线完成项目设置：
https://github.com/jerrygoha/awesome-dotfiles-everything

严格遵循 templates/PROJECT_BOOTSTRAP_PROMPT.md。
```

---

## 快速开始

```bash
git clone https://github.com/jerrygoha/awesome-dotfiles-everything.git
cd awesome-dotfiles-everything
bash scripts/setup.sh
```

---

## 核心原则

1. 默认 **Codex-first** 执行
2. 支持 **Claude Code + Codex + OpenClaw**
3. 未安装 OpenClaw 时优雅跳过相关功能
4. 关键决策持久化到 `md/json`
5. Ralph Loop 默认关闭，仅在确有必要时建议

---

## 项目启动自动化

新项目启动时：

```bash
bash scripts/new_project_bootstrap.sh /path/to/new-project
```

然后把以下文件交给 AI：
- `.bootstrap/PROJECT_BOOTSTRAP_PROMPT.md`

---

## 推荐策略：每个项目独立克隆

为保证可复现性，推荐在每个项目中固定克隆 baseline：

```bash
bash scripts/new_project_bootstrap.sh /path/to/new-project --mode clone --ref v0.1.0
```

该命令会创建：
- `/path/to/new-project/.tooling/awesome-dotfiles-everything`
- `/path/to/new-project/.bootstrap/*`
- `/path/to/new-project/memory/*`

---

## Superpowers 工作流

官方仓库：
- https://github.com/obra/superpowers

推荐流程：
1. Research + plan（先产出 markdown 计划）
2. 用户确认
3. 新开会话
4. 执行 `/subagent-driven-development`
5. 将决策/任务/会议写入 md/json

详情：
- `docs/SUPERPOWERS.md`

---

## Agent Team 模式

参考概念：
- https://code.claude.com/docs/en/agent-teams

已包含你当前员工机器人映射说明：
- `docs/AGENT_TEAMS_MAPPING.md`

---

## OpenClaw + Discord Ops（可选）

若已安装 OpenClaw，可启用：
- 调度钩子
- Discord 决策/对话日志写入 markdown/json
- 防止上下文丢失的记忆同步流程

快速启用：

```bash
bash scripts/setup_openclaw_optional.sh
```

Discord 同步（可选）：

```bash
python3 scripts/discord_ops_sync.py \
  --workspace ~/.openclaw/workspace \
  --channel-map ~/.openclaw/workspace/team/automation/discord-channel-map.json
```

安装 cron：

```bash
bash scripts/install_discord_ops_cron.sh
```

详情：
- `docs/OPENCLAW_OPTIONAL.md`
- `docs/OPENCLAW_DISCORD_OPS.md`

---

## 记忆持久化

No-loss 模式默认保存：
- `memory/decisions.md`
- `memory/tasks.md`
- `memory/meetings.md`
- `memory/events.jsonl`

详情：
- `docs/MEMORY_PERSISTENCE.md`

---

## 仓库结构

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

## 安全与隐私

- 不要在公开文档中硬编码个人绝对路径
- 不要提交本机主机名、私密 token、个人邮箱
- 密钥请存放在 git 之外的本地 env 文件

---

## 发布说明

- `docs/releases/v0.1.1.md`
- `docs/releases/v0.1.0.md`

---

## 更新方式

```bash
# 更新基线
git pull --ff-only

# 更新 superpowers（项目内已安装时）
cd skills/superpowers && git pull --ff-only
```
