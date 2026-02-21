<h1 align="center">awesome-dotfiles-everything</h1>

<p align="center">
  <strong>Claude Code, Codex, OpenClaw를 위한 AI 우선 dotfiles 부트스트랩</strong><br>
  재현 가능한 로컬 환경 + 팀 메모리 + 선택형 멀티에이전트 운영.
</p>

<p align="center">
  <a href="README.md">English</a> | <strong>한국어</strong> | <a href="README_jp.md">日本語</a> | <a href="README_zh.md">中文</a>
</p>

---

## 무엇인가요?

어떤 프로젝트를 시작하든 동일한 AI-ready 기본 세팅으로 시작할 수 있게 해주는 스타터킷입니다.
- 일관된 dotfiles 구조(Holman 스타일)
- Claude/Codex용 프로젝트 부트스트랩 프롬프트
- OpenClaw 선택 연동(크론, 디스코드 운영, 메모리 로깅)
- superpowers 권장 워크플로우 (`research + plan` → 새 세션 → `/subagent-driven-development`)

---

## 빠른 시작

```bash
git clone https://github.com/jerrygoha/awesome-dotfiles-everything.git
cd awesome-dotfiles-everything
bash scripts/setup.sh
```

새 프로젝트에서 Claude Code/Codex에 다음처럼 지시하세요.

```text
https://github.com/<your-username>/awesome-dotfiles-everything 기준으로 세팅해줘.
templates/PROJECT_BOOTSTRAP_PROMPT.md를 그대로 따라.
```

---

## 핵심 원칙

1. 기본 실행은 Codex 우선
2. Claude Code + Codex + OpenClaw 모두 지원
3. OpenClaw 없으면 기능을 우아하게 스킵
4. 중요한 의사결정은 md/json으로 영속 저장
5. Ralph Loop는 필요할 때만 제안

---

## 문서 링크
- Superpowers: `docs/SUPERPOWERS.md`
- Agent Team 매핑: `docs/AGENT_TEAMS_MAPPING.md`
- 메모리 영속화: `docs/MEMORY_PERSISTENCE.md`
- OpenClaw 선택 연동: `docs/OPENCLAW_OPTIONAL.md`
- Ralph Loop 정책: `docs/RALPH_LOOP_POLICY.md`

---

## 프로젝트 킥오프 자동화

```bash
bash scripts/new_project_bootstrap.sh /path/to/new-project
```

생성되는 `.bootstrap/PROJECT_BOOTSTRAP_PROMPT.md`를 AI에게 전달하면 됩니다.
