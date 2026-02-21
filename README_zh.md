<h1 align="center">awesome-dotfiles-everything</h1>

<p align="center">
  <strong>面向 Claude Code / Codex / OpenClaw 的 AI-first dotfiles 启动模板</strong><br>
  可复现本地环境 + 团队记忆 + 可选多代理协作。
</p>

<p align="center">
  <a href="README.md">English</a> | <a href="README_ko.md">한국어</a> | <a href="README_jp.md">日本語</a> | <strong>中文</strong>
</p>

---

## 这是什么？

用于在任何新项目中快速落地统一 AI-ready 基线：
- 一致的 dotfiles 目录结构（Holman 风格）
- Claude/Codex 项目初始化提示词
- OpenClaw 可选集成（定时任务、Discord 运营、记忆日志）
- 推荐 superpowers 工作流（`research + plan` → 新会话 → `/subagent-driven-development`）

## 快速开始

```bash
git clone https://github.com/jerrygoha/awesome-dotfiles-everything.git
cd awesome-dotfiles-everything
bash scripts/setup.sh
```

## 文档
- `docs/SUPERPOWERS.md`
- `docs/AGENT_TEAMS_MAPPING.md`
- `docs/MEMORY_PERSISTENCE.md`
- `docs/OPENCLAW_OPTIONAL.md`
- `docs/OPENCLAW_DISCORD_OPS.md`
- `docs/RALPH_LOOP_POLICY.md`

## 新项目启动

```bash
bash scripts/new_project_bootstrap.sh /path/to/new-project
```
