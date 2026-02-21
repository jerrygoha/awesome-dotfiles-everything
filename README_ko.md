<h1 align="center">awesome-dotfiles-everything</h1>

<p align="center">
  <strong>Claude Code, Codex, OpenClaw를 위한 AI-first dotfiles 부트스트랩</strong><br>
  재현 가능한 로컬 환경 + 팀 메모리 + 선택형 멀티에이전트 운영.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20WSL-lightgrey" />
  <img src="https://img.shields.io/badge/AI-Claude%20Code%20%7C%20Codex%20%7C%20OpenClaw-purple" />
  <img src="https://img.shields.io/badge/superpowers-recommended-blue" />
  <img src="https://img.shields.io/badge/mode-codex--first-success" />
</p>

<p align="center">
  <a href="README.md">English</a> | <strong>한국어</strong> | <a href="README_jp.md">日本語</a> | <a href="README_zh.md">中文</a>
</p>

---

## 목차

- [이 프로젝트는 무엇인가요?](#이-프로젝트는-무엇인가요)
- [AI로 설치하기](#ai로-설치하기)
- [빠른 시작](#빠른-시작)
- [핵심 원칙](#핵심-원칙)
- [프로젝트 킥오프 자동화](#프로젝트-킥오프-자동화)
- [Superpowers 워크플로우](#superpowers-워크플로우)
- [Agent Team 모드](#agent-team-모드)
- [OpenClaw + Discord 운영(선택)](#openclaw--discord-운영선택)
- [메모리 영속화](#메모리-영속화)
- [저장소 구조](#저장소-구조)
- [보안 및 프라이버시](#보안-및-프라이버시)
- [릴리즈 노트](#릴리즈-노트)
- [업데이트 방법](#업데이트-방법)

---

## 이 프로젝트는 무엇인가요?

어떤 프로젝트를 시작하든 동일한 AI-ready 기준선으로 시작하기 위한 스타터킷입니다.
- Holman 스타일 dotfiles 토픽 구조
- Claude/Codex용 프로젝트 부트스트랩 프롬프트
- OpenClaw 선택 연동(스케줄러, Discord 운영 로그, 메모리 동기화)
- superpowers 권장 흐름(`research + plan` → 새 세션 → `/subagent-driven-development`)

디자인 참고:
- Claw-Empire README 스타일: https://github.com/GreenSheep01201/claw-empire/blob/main/README.md
- Holman dotfiles 구조: https://github.com/holman/dotfiles/tree/master

---

## AI로 설치하기

프로젝트 초기화 시 Claude/Codex에 아래를 붙여 넣으세요.

```text
다음 기준선을 사용해서 프로젝트 세팅해줘:
https://github.com/jerrygoha/awesome-dotfiles-everything

templates/PROJECT_BOOTSTRAP_PROMPT.md를 정확히 따라.
```

---

## 빠른 시작

```bash
git clone https://github.com/jerrygoha/awesome-dotfiles-everything.git
cd awesome-dotfiles-everything
bash scripts/setup.sh
```

---

## 핵심 원칙

1. 기본 실행은 **Codex 우선**
2. **Claude Code + Codex + OpenClaw** 모두 지원
3. OpenClaw가 없으면 관련 기능을 우아하게 스킵
4. 중요한 의사결정은 `md/json`으로 영속 저장
5. Ralph Loop는 기본 OFF, 필요할 때만 제안

---

## 프로젝트 킥오프 자동화

새 프로젝트 시작 시:

```bash
bash scripts/new_project_bootstrap.sh /path/to/new-project
```

그 다음 AI에게 아래 파일 전달:
- `.bootstrap/PROJECT_BOOTSTRAP_PROMPT.md`

---

## Superpowers 워크플로우

공식 저장소:
- https://github.com/obra/superpowers

권장 흐름:
1. Research + plan (먼저 마크다운 계획)
2. 사용자 승인
3. 새 세션 시작
4. `/subagent-driven-development` 실행
5. 결정/작업/회의를 md/json으로 기록

자세히:
- `docs/SUPERPOWERS.md`

---

## Agent Team 모드

참고 개념:
- https://code.claude.com/docs/en/agent-teams

현재 직원 봇 기준 매핑 가이드 포함:
- `docs/AGENT_TEAMS_MAPPING.md`

---

## OpenClaw + Discord 운영(선택)

OpenClaw가 설치되어 있으면 다음을 활성화할 수 있습니다.
- 스케줄러 훅
- Discord 의사결정/대화 로그를 markdown/json에 기록
- 기억 손실 방지용 메모리 동기화 루틴

빠른 활성화:

```bash
bash scripts/setup_openclaw_optional.sh
```

Discord 운영 동기화(선택):

```bash
python3 scripts/discord_ops_sync.py \
  --workspace ~/.openclaw/workspace \
  --channel-map ~/.openclaw/workspace/team/automation/discord-channel-map.json
```

크론 설치:

```bash
bash scripts/install_discord_ops_cron.sh
```

자세히:
- `docs/OPENCLAW_OPTIONAL.md`
- `docs/OPENCLAW_DISCORD_OPS.md`

---

## 메모리 영속화

No-loss 모드 기본 저장 경로:
- `memory/decisions.md`
- `memory/tasks.md`
- `memory/meetings.md`
- `memory/events.jsonl`

자세히:
- `docs/MEMORY_PERSISTENCE.md`

---

## 저장소 구조

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

## 보안 및 프라이버시

- 공개 문서에 개인 절대경로 하드코딩 금지
- 로컬 호스트명, 토큰, 개인 이메일 커밋 금지
- 시크릿은 git 외부의 로컬 env 파일에서 관리

---

## 릴리즈 노트

- `docs/releases/v0.1.0.md`

---

## 업데이트 방법

```bash
# baseline 업데이트
git pull --ff-only

# superpowers 업데이트(프로젝트 내 설치 시)
cd skills/superpowers && git pull --ff-only
```
